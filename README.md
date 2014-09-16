vagrant-geoportal
=================

Create a vm serving GeoPortal in a matter of minutes.

Under the files dir you will find code written by ESRI inc, licensed under the Apache License, Version 2.0. This license is included in this repository.

### Local Requirements:
* [git] (https://help.github.com/articles/set-up-git)
* [VirtualBox] (http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html)
* [Vagrant] (http://www.vagrantup.com/)
* [Fabric] (http://fabfile.org)

### Create Virtual Machine and Install Dependencies:
``vagrant up``

### Install Postgres, Tomcat, and ESRI GeoPortal Server
```fab dev init```

Or, if you want to run from a fresh .war build from bleeding-edge geoportal code:
```fab dev build_new```

*NOTE: currently there's an issue with running installs from the fabfile. If you ssh into the VM and run the fabfile commands by hand it works fine. See below for the list of commands that were successful.

### Prompts:
* Password for vagrant
``vagrant``
* Create Password for user postgres
``postgres``
    (accept the defaults)
* Create password for role geoportal
``geoportal``
    (accept the defaults)
* Password for postgres
``postgres``

### Using
* Open a browser and navigate to [http://localhost:8081/geoportal/catalog/main/home.page] (http://localhost:8081/geoportal/catalog/main/home.page)
* Click 'Login'
* Enter credentials 'gptuser', 'gptuser'


### List of Commands
```
sudo apt-get install dos2unix
sudo wget -O /tmp/postgresql-9.1.2.tar.gz ftp://ftp.postgresql.org/pub/source/v9.1.2/postgresql-9.1.2.tar.gz
sudo tar zxvf /tmp/postgresql-9.1.2.tar.gz --directory /usr/local/etc/
cd /usr/local/etc/postgresql-9.1.2
./configure && make && sudo make install
sudo adduser postgres  -> postgres
sudo addgroup postgres postgres
sudo mkdir /usr/local/pgsql/data
export PGDATA=/usr/local/pgsql/data
sudo chown postgres:postgres /usr/local/pgsql/data
sudo -u postgres /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data initdb
sudo -u postgres /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data start
sudo cp /usr/local/etc/postgresql-9.1.2/contrib/start-scripts/linux /etc/init.d/postgresql
sudo chown root:root /etc/init.d/postgresql
sudo chmod +x /etc/init.d/postgresql
sudo update-rc.d postgresql defaults
sudo wget -O /tmp/apache-tomcat-6.0.37.tar.gz http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.37/bin/apache-tomcat-6.0.37.tar.gz
sudo tar zxvf /tmp/apache-tomcat-6.0.37.tar.gz --directory /tmp/
sudo mv /tmp/apache-tomcat-6.0.37 /usr/local/tomcat6
sudo cp /vagrant/files/tomcat /usr/local/etc/
sudo cp /usr/local/etc/tomcat /etc/init.d/tomcat
sudo chown root:root /etc/init.d/tomcat
sudo chmod +x /etc/init.d/tomcat
sudo update-rc.d tomcat defaults
sudo /usr/local/tomcat6/bin/startup.sh 
sudo chown -R vagrant:vagrant /usr/local/etc
cd /usr/local/etc && git clone https://github.com/Ecotrust/geoportal-server.git
sudo cp -r /usr/local/etc/geoportal-server/* /usr/local/etc/geoportal/
sudo chown -R geoportal:geoportal /usr/local/etc/geoportal
sudo cp /vagrant/files/grants_linuxpg.sh /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL/grants_linuxpg.sh 
sudo cp /vagrant/files/create_schema_linuxpg.sh /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL/create_schema_linuxpg.sh
sudo dos2unix /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL/*
sudo chown -R postgres:postgres /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL 
sudo chmod -R +x /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL
sudo service postgresql status
cd /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL
sudo -u postgres /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL/grants_linuxpg.sh localhost 5432 postgres geoportal postgres geoportal -> geoportal
sudo -u postgres /usr/local/etc/geoportal/geoportal/etc/sql/PostgreSQL/create_schema_linuxpg.sh localhost 5432 postgres geoportal 
sudo cp /vagrant/files/geoportal.war /usr/local/tomcat6/webapps/geoportal.war
sudo /usr/local/tomcat6/bin/shutdown.sh 
sudo /usr/local/tomcat6/bin/startup.sh
sudo cp /vagrant/files/gpt.xml /usr/local/tomcat6/webapps/geoportal/WEB-INF/classes/gpt/config/gpt.xml ** NOTE: For dev, use the file in /vagrant/files/solr/gpt.xml
sudo wget -O /usr/local/tomcat6/lib/postgresql-9.1-901.jdbc4.jar http://jdbc.postgresql.org/download/postgresql-9.1-901.jdbc4.jar
sudo cp /vagrant/files/geoportal.xml /usr/local/tomcat6/conf/Catalina/localhost/
sudo chmod +wx /usr/local/tomcat6/conf/Catalina/localhost/geoportal.xml
sudo /usr/local/tomcat6/bin/shutdown.sh
sudo /usr/local/tomcat6/bin/startup.sh

sudo cd /usr/local/tomcat6/webapps
sudo mv ROOT ROOT_temp
sudo ln -s /usr/local/etc/new-rdf/_site_generated/ ./ROOT
sudo /usr/local/tomcat6/bin/shutdown.sh
sudo /usr/local/tomcat6/bin/startup.sh
sudo cp /vagrant/files/gc.war /usr/local/tomcat6/webapps/gc.war
sudo cp /vagrant/files/solr/solr.war /usr/local/tomcat6/webapps/solr.war

sudo /usr/local/tomcat6/bin/shutdown.sh
sudo /usr/local/tomcat6/bin/startup.sh

sudo cp /vagrant/files/gptdb2solr.xml /usr/local/tomcat6/webapps/gc/WEB-INF/classes/gc-config/gptdb2solr.xml

sudo mkdir /home/solr
sudo cp /vagrant/files/solr/web.xml /usr/local/tomcat6/webapps/solr/WEB-INF/web.xml
sudo cp /vagrant/files/solr/solr.xml /home/solr/solr.xml
sudo mkdir /home/solr/collection1
sudo cp /vagrant/files/solr/solr.xml /home/solr/solr.xml
sudo mkdir /home/solr/collection1/data
sudo mkdir /home/solr/collection1/conf
sudo cp -R /vagrant/files/solr/conf/* /home/solr/collection1/conf/

sudo /usr/local/tomcat6/bin/shutdown.sh && sudo /usr/local/tomcat6/bin/startup.sh

```
