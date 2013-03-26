# = Class: collectd::params
#
# This module manages collectd
#
# == Parameters: none
#
# == Actions:
#
# == Requires: see Modulefile
#
# == Sample Usage:
#
class collectd::params {
  case $::lsbdistcodename {
    'squeeze', 'wheezy', 'precise', 'quantal': {
      $ensure         = present
      $ensure_enable  = true
      $ensure_running = running
      $disabled_hosts = []
      $server         = "collectd.${::domain}"
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
