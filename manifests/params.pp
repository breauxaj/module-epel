# Class: epel::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - RedHat only
#
class epel::params {
  case $::operatingsystem {
    'CentOS', 'RedHat': {
      $epel_package = 'epel-release'
    
      case $::operatingsystemmajrelease {
        '6': {
          if ( !$epel_installed ) {
            yumrepo { 'epel-temp':
              baseurl        => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
              failovermethod => 'priority',
              enabled        => '1',
              gpgcheck       => '1',
              gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
              descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
              require        => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6'],
            }
            
            file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6':
              ensure => present,
              owner  => 'root',
              group  => 'root',
              mode   => '0644',
              source => 'puppet:///modules/epel/RPM-GPG-KEY-EPEL-6',
            }
          } else {
            yumrepo { 'epel-temp':
              ensure => absent
            }
          }
        }
        '7': {
          if ( !$epel_installed ) {
            yumrepo { 'epel-temp':
              baseurl        => 'http://download.fedoraproject.org/pub/epel/7/$basearch',
              failovermethod => 'priority',
              enabled        => '1',
              gpgcheck       => '1',
              gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
              descr          => 'Extra Packages for Enterprise Linux 7 - $basearch',
            }

            file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7':
              ensure => present,
              owner  => 'root',
              group  => 'root',
              mode   => '0644',
              source => 'puppet:///modules/epel/RPM-GPG-KEY-EPEL-7',
            }
          } else {
            yumrepo { 'epel-temp':
              ensure => absent
            }
          }
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} ${::operatingsystemmajrelease} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} based system.")
    }
  }
}