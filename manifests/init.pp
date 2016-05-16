# Class: epel
#
# This class installs the epel repository
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the epel repository
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'epel':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'epel':
#      ensure => 'absent'
#    }
#
class epel (
  $ensure = 'latest'
) {
  case $::operatingsystem {
    'centos','redhat': {
      case $::epel_version {
        '6': {
          if ( $epel_installed ) {
            notify{ 'default': message => "install EPEL repo" }
          }
        }
        '7': {
          if ( $epel_installed ) {
            notify{ 'default': message => "install EPEL repo" }
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
