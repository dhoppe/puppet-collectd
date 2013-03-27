# = Class: collectd
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
class collectd {
  class { 'collectd::package': }
  class { 'collectd::config': }
  class { 'collectd::service': }

  collectd::file { 'cpu': }
  collectd::file { 'df': }
  collectd::file { 'disk': }
  collectd::file { 'entropy': }
  collectd::file { 'interface': }
  collectd::file { 'irq': }
  collectd::file { 'load': }
  collectd::file { 'memory': }
  collectd::file { 'network': }
  collectd::file { 'processes': }
  collectd::file { 'rrdtool': }
  collectd::file { 'swap': }
  collectd::file { 'syslog': }
  collectd::file { 'users': }

  if defined('monit') {
    monit::file { 'collectd': }
  }
}
