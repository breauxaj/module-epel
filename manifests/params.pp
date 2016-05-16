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
            notify("install EPEL repo")
          }
        }
        '7': {
          if ( !$epel_installed ) {
            notify("install EPEL repo")
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
