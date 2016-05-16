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
) inherits ::epel::params {
  package { $::epel::params::epel_package:
    ensure  => $ensure,
  }

}
