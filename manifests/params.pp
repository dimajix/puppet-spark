# == Class hive::params
#
# This class is meant to be called from hive
# It sets variables according to platform
#
class spark::params {
  case $::osfamily {
    'Debian': {
      $packages = {
        common => [ 'spark-core' ],
        master => 'spark-master',
        worker => 'spark-worker',
        history => 'spark-history-server',
        frontend => 'spark-python',
      }
      $daemons = {
        master => 'spark-master',
        worker => 'spark-worker',
      }
    }
    'RedHat': {
      $packages = {
        common => [ 'spark-core' ],
        master => 'spark-master',
        worker => 'spark-worker',
        history => 'spark-history-server',
        frontend => 'spark-python',
      }
      $daemons = {
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $alternatives = $::osfamily ? {
    debian => 'cluster',
    redhat => undef,
  }
  $confdir = $::osfamily ? {
    debian => '/etc/spark/conf',
    redhat => '/etc/spark',
  }

  $workers = ['127.0.0.1']
  $master = '127.0.0.1'
  
  $master_port = 7077
  $worker_port = 7078
  $master_webui_port = 18080
  $worker_webui_port = 18081
}
