# ensure that apt update is run before any packages are installed
class apt {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  # Ensure apt-get update has been run before installing any packages
  Exec["apt-update"] -> Package <| |>

}

include apt

package { "build-essential":
    ensure => "installed"
}

package { "git-core":
    ensure => "latest"
}

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

package {'libreadline6-dev':
    ensure => "latest",
}

package {'zlib1g-dev':
    ensure => "latest",
}

package {'openjdk-6-jre':
    ensure => "latest",
}

#package {'openjdk-6-jdk':
#    ensure => "latest",
#}

file { "/usr/local/etc/geoportal":
    ensure => "directory",
}

file { "/usr/local/etc/lucene":
    ensure => "directory",
}

file { "/usr/local/etc/lucene/assertion":
    ensure => "directory",
}

user { "geoportal":
  groups => ['adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare', 'admin'],
  comment => 'geoportal os user. This user was created by Puppet',
  ensure => 'present',
  managehome => 'true'
}

file { "environment variables":
  path => "/etc/profile.d/geoportal.sh",
  content => template("geoportal.sh"),
  owner => "geoportal"
}

package {'unzip':
    ensure => "latest",
}

