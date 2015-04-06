# == Class: spark
#
#
class spark (
  $group = $spark::params::group,
  $master_hostname = $spark::params::master_hostname,
  $master_port = $spark::params::master_port,
  $worker_port = $spark::params::worker_port,
  $master_webui_port = $spark::params::master_webui_port,
  $worker_webui_port = $spark::params::worker_webui_port,
  $workers = $spark::params::workers,
  $properties = undef,
  $descriptions = undef,
  $alternatives = $spark::params::alternatives,
  $features = undef,
) inherits spark::params {
  include stdlib
}

