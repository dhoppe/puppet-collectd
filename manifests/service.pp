# = Class: collectd::service
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
class collectd::service (
  $ensure_enable  = hiera('ensure_enable', $collectd::params::ensure_enable),
  $ensure_running = hiera('ensure_running', $collectd::params::ensure_running),
  $disabled_hosts = hiera('disabled_hosts', $collectd::params::disabled_hosts),
) inherits collectd::params {
  validate_bool($ensure_enable)
  validate_re($ensure_running, '^(running|stopped)$')
  validate_array($disabled_hosts)

  service { 'collectd':
    ensure     => $ensure_running,
    enable     => $ensure_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['collectd::config'],
  }

  if $::hostname in $disabled_hosts {
    Service <| title == 'collectd' |> {
      ensure => stopped,
      enable => false,
    }
  }
}
