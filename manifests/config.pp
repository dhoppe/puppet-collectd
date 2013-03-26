# = Class: collectd::config
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
class collectd::config (
  $ensure    = hiera('ensure', $collectd::params::ensure),
  $server    = hiera('server', $collectd::params::server),
) inherits collectd::params {
  validate_re($ensure, '^(absent|present)$')
  validate_string($server)

  file {
    '/etc/collectd/collectd.conf':
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('collectd/common/etc/collectd/collectd.conf.erb'),
      notify  => Service['collectd'],
      require => Package['collectd'];
    '/etc/collectd/conf.d':
      ensure  => directory,
      force   => true,
      purge   => true,
      recurse => true,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['collectd'];
    '/etc/default/collectd':
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/collectd/common/etc/default/collectd',
      notify  => Service['collectd'],
      require => Package['collectd'];
  }
}
