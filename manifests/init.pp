# == Class: spark
#
#
class spark (
  $group = $spark::params::group,
  $master = $spark::params::master,
  $workers = $spark::params::workers,
  $master_port = $spark::params::master_port,
  $worker_port = $spark::params::worker_port,
  $master_webui_port = $spark::params::master_webui_port,
  $worker_webui_port = $spark::params::worker_webui_port,
  $yarn_namenode = undef,
  $alternatives = $spark::params::alternatives,
  $features = undef,
) inherits spark::params {
  include stdlib
  
  if $yarn_namenode {
    $yarn_properties = {
      'spark.yarn.access.namenodes' => $yarn_namenode,
      'spark.master' => 'yarn'
    }
  }
  else {
    $master_properties = {
      'spark.master' => "spark://${master}:${master_port}"
    }
  }
  
  $_defaults = merge($yarn_properties, $master_properties)
}

