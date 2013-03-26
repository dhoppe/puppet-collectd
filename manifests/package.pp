# = Class: collectd::package
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
class collectd::package (
  $ensure = hiera('ensure', $collectd::params::ensure),
) inherits collectd::params {
  validate_re($ensure, '^(absent|present)$')

  package { 'collectd':
    ensure => $ensure,
  }
}
