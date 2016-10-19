epel
====

This module changes state based on whether the epel-release rpm is installed. If
the rpm is not present, a temporary yum repository is added, the epel-release
rpm is installed. On subsequent runs, the temporary repo is removed.

Samples
-------
```
include epel
```
```
class { 'epel':
  ensure => 'latest'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com