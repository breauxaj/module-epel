node default {
  include ::epel

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

}