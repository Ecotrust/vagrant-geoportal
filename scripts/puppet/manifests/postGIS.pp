# ensure that apt update is run before any packages are installed
class apt {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  # Ensure apt-get update has been run before installing any packages
  Exec["apt-update"] -> Package <| |>

}

include apt

# include tomcat

# include tomcat::sunjdk

package { "build-essential":
    ensure => "installed"
}

# package { "git-core":
#     ensure => "latest"
# }

# package { "subversion":
#     ensure => "latest"
# }

# package { "mercurial":
#     ensure => "latest"
# }

package { "vim":
    ensure => "latest"
}

package {'libgeos-dev':
    ensure => "latest"
}

package {'libgdal1-dev':
    ensure => "latest"
}

#class { "postgresql::server": version => "9.1",
#    listen_addresses => 'localhost',
#    max_connections => 100,
#    shared_buffers => '24MB',
#}

#postgresql::database { "postgis":
#  owner => "vagrant",
#}

#exec { "load postgis":
#  command => "/usr/bin/psql -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql -d postgis",
#  user => "vagrant",
#  require => Postgresql::Database['postgis']
#}

#exec { "load spatialrefs":
#  command => "/usr/bin/psql -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql -d postgis",
#  user => "vagrant",
#  require => Postgresql::Database['postgis']
#}

package {'libreadline6-dev':
    ensure => "latest",
}

package {'zlib1g-dev':
    ensure => "latest",
}

package {'openjdk-6-jre':
    ensure => "latest",
}

file { "/usr/local/etc/geoportal":
    ensure => "directory",
}

file { "/usr/local/etc/lucene":
    ensure => "directory",
}

file { "/usr/local/etc/lucene/assertion":
    ensure => "directory",
}

# create geoportal user?
user { "geoportal":
  groups => ['adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare', 'admin'],
  comment => 'geoportal os user. This user was created by Puppet',
  ensure => 'present',
  managehome => 'true'
}

#user { "postgres":
#  ensure => 'present',
#  groups => ['postgres', 'ssl-cert'],
#  comment => 'postgres os user. Should be created from PostgreSQL install',
#  managehome => 'true',
#  require => [Exec['load postgis'], Exec['load spatialrefs']]
#}

file { "environment variables":
  path => "/etc/profile.d/geoportal.sh",
  content => template("geoportal.sh"),
  owner => "geoportal"
}

# This differs greatly from the docs. Fingers crossed!
#package {'tomcat6':
#    ensure => "latest",
#}

#service { "tomcat6":
#  ensure => "running",
#  require => Package['tomcat6']
#}

package {'unzip':
    ensure => "latest",
}

#exec { "get geoportal zip" :
#  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#  command => "wget -O /tmp/geoportal-1.2.zip http://sourceforge.net/projects/geoportal/files/latest/download",
#  user => "geoportal",
#  timeout => 600,
#  require => User['geoportal']
#}

#exec { "unzip geoportal" :
#  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#  command => "unzip /tmp/geoportal-1.2.zip -d /usr/local/etc/geoportal",
#  require => [Package['unzip'], Exec['get geoportal zip'], File['/usr/local/etc/geoportal']],
#  user => "geoportal"
#}

#exec { "postgres owner":
#  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#  command => "chown -R postgres:postgres /usr/local/etc/geoportal/Database\ Scripts/PostgreSQL",
#  require => [User['postgres'], Exec['load postgis'], Exec['load spatialrefs']],
#  user => "vagrant"
#}

#exec { "postgres execute":
#  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#  command => "chmod -R +x /usr/local/etc/geoportal/Database\ Scripts/PostgreSQL",
#  require => Exec['postgres owner'],
#  user => "vagrant"
#}

