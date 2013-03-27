# = Define: collectd::file
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
define collectd::file() {
  file { "/etc/collectd/conf.d/${name}":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("collectd/common/etc/collectd/conf.d/${name}.erb"),
    notify  => Service['collectd'],
    require => Class['collectd::config'],
  }
}
