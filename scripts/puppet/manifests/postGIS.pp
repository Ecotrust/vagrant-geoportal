# ensure that yum update is run before any packages are installed
class yum {
  exec { "yum-update":
    command => "/usr/bin/yum update -y"
  }

  # Ensure yum update has been run before installing any packages
  # Exec["yum-update"] -> Package <| |>

}

#class nginx {
#  exec { "include-nginx":
#    command => "/bin/rpm -ivhf /vagrant/files/nginx-release-centos-6-0.el6.ngx.noarch.rpm"
#  }
#}

include yum
#include nginx

#From http://serverfault.com/questions/127460/how-do-i-install-a-yum-package-group-with-puppet
define yumgroup($ensure = "present", $optional = false){
  case $ensure {
    present,installed: {
      $pkg_types_arg = $optional ? {
        true => "--setopt=group_package_types=optional,default,mandatory",
        default => ""
      }
      exec { "Installing $name yum group":
        command => "yum -y groupinstall $pkg_types_arg $name",
        unless => "yum -y groupinstall $pkg_types_arg $name --downloadonly",
        timeout => 600,
      }
    }
  }
}

#yumrepo { "epel":
#    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
#    enabled => 1,
#    descr => "Epel"
#}

package {'gcc':
    ensure => "latest",
}

#package {'libreadline6-dev':     For ubuntu
package {'readline-devel':
    ensure => "latest",
}

package {'zlib-devel':
    ensure => "latest",
}

package {'make':
    ensure => "latest",
}

package {'java-1.6.0-openjdk':
    ensure => "latest",
}

package {'system-config-securitylevel':
    ensure => "latest",
}


package { "git":
    ensure => "latest"
}

package { "vim-enhanced":
    ensure => "latest"
}

#package { "nginx":
#    ensure => "latest",
#    require => Exec[ "include-nginx"]
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

group { "admin":
    ensure => "present",
}

user { "geoportal":
  groups => ['wheel'],
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

