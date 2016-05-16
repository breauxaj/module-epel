# Class: epel::params
#
# This class sets parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other operatingsystem patterns - redhat only
#
class epel::params {
  case $::operatingsystem {
    'centos','redhat': {
      case $::epel_version {
        '6': {
          if ( !$epel_installed ) {
            yumrepo { 'epel-temp':
              baseurl        => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
              failovermethod => 'priority',
              enabled        => '1',
              gpgcheck       => '1',
              gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
              descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
            }
            
            $epel_package = 'epel-release'
          } else {
            yumrepo { 'epel-temp':
              ensure => absent
            }
            
            $epel_package = 'epel-release'
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
            
            $epel_package = 'epel-release'
          } else {
            yumrepo { 'epel-temp':
              ensure => absent
            }

            $epel_package = 'epel-release'
          }
        }
        default: {
          fail("Unsupported version: ${::epel_version}")
        }
      }
    }
    default: { }
  }

}
