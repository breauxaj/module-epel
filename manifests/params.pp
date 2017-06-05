# Class: epel::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - RedHat only
#
class epel::params {
  $epel_package_ensure = 'latest'

  case $::osfamily {
    'RedHat': {
      $epel_package = 'epel-release'

      case $::operatingsystem {
        default: {
          case $::operatingsystemmajrelease {
            default: {
              if ( !$::epel_installed ) {
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
          }
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
