from fabric.api import *
from fabric.contrib.files import exists
import time

vars = {
    'gp_dir': '/usr/local/etc/geoportal',
    'tomcat_dir': '/usr/local/tomcat6',
    'webapp_dir': '/usr/local/tomcat6/webapps',
    'tomcat_version': '6.0.36'
}

env.forward_agent = True
# env.key_filename = '~/.vagrant.d/insecure_private_key'

def dev():
    """ Use development server settings """
    servers = ['vagrant@127.0.0.1:2222']
    env.hosts = servers
    return servers

def prod():
    """ Use production server settings """
    servers = []
    env.hosts = servers
    return servers

def test():
    """ Use test server settings """
    servers = []
    env.hosts = servers
    return servers

def all():
    """ Use all servers """
    env.hosts = dev() + prod() + test()

def init():
    """ Initialize the geoportal application """   
    _install_postgres()
    _init_postgres()
    _install_tomcat()
    _install_geoportal()
    _config_database()
    _deploy_geoportal()
    _configure_jdbc()
    restart_tomcat()
    
def _set_environment():
    run('')
    
def _install_postgres():
    #change to /usr/local/etc, not /tmp/post...., nvm, rectified by tar command
    run('sudo wget -O /tmp/postgresql-9.1.2.tar.gz ftp://ftp.postgresql.org/pub/source/v9.1.2/postgresql-9.1.2.tar.gz')
    run('sudo tar zxvf /tmp/postgresql-9.1.2.tar.gz --directory /usr/local/etc/')
    run('cd /usr/local/etc/postgresql-9.1.2 && \
        ./configure && \
        make && \
        sudo make install')
        
    #Create postgres user
    run('sudo adduser postgres')
    run('sudo addgroup postgres postgres')
    
    #Create PG data dir
    run('sudo mkdir /usr/local/pgsql/data')
    run('export PGDATA=/usr/local/pgsql/data')
    run('sudo chown postgres:postgres /usr/local/pgsql/data')
    
def _init_postgres():
    run('sudo -u postgres /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data initdb') 
    run('sudo -u postgres /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data start') 
    
    #set up postgres to restart on boot
    run('sudo cp /usr/local/etc/postgresql-9.1.2/contrib/start-scripts/linux /etc/init.d/postgresql')
    run('sudo chown root:root /etc/init.d/postgresql')
    run('sudo chmod +x /etc/init.d/postgresql')
    run('sudo update-rc.d postgresql defaults')
    
def _install_tomcat():
    run('sudo wget -O /tmp/apache-tomcat-%(tomcat_version)s.tar.gz http://apache.org/dist/tomcat/tomcat-6/v%(tomcat_version)s/bin/apache-tomcat-%(tomcat_version)s.tar.gz' % vars)
    run('sudo tar zxvf /tmp/apache-tomcat-%(tomcat_version)s.tar.gz --directory /tmp/' % vars)
    run('sudo mv /tmp/apache-tomcat-%(tomcat_version)s %(tomcat_dir)s' % vars)
    
    #Apply startup script
    run('sudo cp /vagrant/files/tomcat /usr/local/etc/')
    run('sudo cp /usr/local/etc/tomcat /etc/init.d/tomcat')
    run('sudo chown root:root /etc/init.d/tomcat')
    run('sudo chmod +x /etc/init.d/tomcat')
    run('sudo update-rc.d tomcat defaults')
    
    #Run Tomcat
    run('sudo /etc/init.d/tomcat start')
    
#Replace this with an install of the cutting edge - perhaps via github?
    #When you do, remove download step from puppet script
def _install_geoportal():
    #unpack it
    run('sudo wget -O /tmp/geoportal-1.2.zip http://sourceforge.net/projects/geoportal/files/latest/download')
    run('sudo unzip /tmp/geoportal-1.2.zip -d %(gp_dir)s' % vars)
    run('sudo chown -R geoportal:geoportal %(gp_dir)s' % vars)
    
def _config_database():
    #Set up appropriate DB permissions
    run ('sudo cp /vagrant/files/grants_linuxpg.sh %(gp_dir)s/Database\ Scripts/PostgreSQL/grants_linuxpg.sh' % vars)
    run ('sudo cp /vagrant/files/create_schema_linuxpg.sh %(gp_dir)s/Database\ Scripts/PostgreSQL/create_schema_linuxpg.sh' % vars)
    run('sudo chown -R postgres:postgres %(gp_dir)s/Database\ Scripts/PostgreSQL' % vars)
    run('sudo chmod -R +x %(gp_dir)s/Database\ Scripts/PostgreSQL' % vars)
    
    start_postgres()
    
    with settings(warn_only=True):
        
        pwd_status = '1'
        
        while not str(pwd_status) == '0':
            #Create geoportal user in Postgres
            run('cd %(gp_dir)s/Database\ Scripts/PostgreSQL/ &&\
                sudo -u postgres %(gp_dir)s/Database\ Scripts/PostgreSQL/grants_linuxpg.sh localhost 5432 postgres geoportal postgres geoportal' % vars)
            pwd_status = run('echo $?')

        pwd_status = '1'
            
        while not str(pwd_status) == '0':
            run('cd %(gp_dir)s/Database\ Scripts/PostgreSQL/ &&\
                sudo -u postgres %(gp_dir)s/Database\ Scripts/PostgreSQL/create_schema_linuxpg.sh localhost 5432 postgres geoportal' % vars)
            pwd_status = run('echo $?')
    
def _deploy_geoportal():
    run('sudo cp %(gp_dir)s/Web\ Applications/Geoportal/geoportal.war %(webapp_dir)s/geoportal.war' % vars)
    restart_tomcat()
    while not exists('%(webapp_dir)s/geoportal/' % vars):
        print "\
        geoportal.war has not unpacked itself yet. \
        Waiting 3 seconds before retry."
        time.sleep(3)
    run('sudo cp /vagrant/files/gpt.xml %(webapp_dir)s/geoportal/WEB-INF/classes/gpt/config/gpt.xml' % vars)

def _configure_jdbc():
    run('sudo wget -O %(tomcat_dir)s/lib/postgresql-9.1-901.jdbc4.jar http://jdbc.postgresql.org/download/postgresql-9.1-901.jdbc4.jar' % vars)
    # run('sudo cp %(gp_dir)s/Other/JNDI\ Configuration/geoportal.xml %(tomcat_dir)s/conf/Catalina/localhost/' % vars)
    run('sudo cp /vagrant/files/geoportal.xml %(tomcat_dir)s/conf/Catalina/localhost/' % vars)
    run('sudo cp /vagrant/files/geoportal.xml %(tomcat_dir)s/lib/' % vars)
    run('sudo chmod +wx %(tomcat_dir)s/conf/Catalina/localhost/geoportal.xml' % vars)
    
def start_tomcat():
    with settings(hide('warnings'), warn_only=True):
        run('sudo %(tomcat_dir)s/bin/startup.sh' % vars, pty=False)

def stop_tomcat():
    with settings(hide('warnings'), warn_only=True):
        run('sudo %(tomcat_dir)s/bin/shutdown.sh' % vars, pty=False)
    
def restart_tomcat():
    #restart Tomcat
    stop_tomcat()
    time.sleep(1)
    start_tomcat()
    
def start_postgres():
    with settings(warn_only=True):
        result = run('sudo service postgresql status', pty=False)
        
        while not result.return_code == 0:
            print 'Postgres status = ' + result
            run('sudo service postgresql start', pty=False)
            time.sleep(3)
            run('')
            result = run('sudo service postgresql status', pty=False)
