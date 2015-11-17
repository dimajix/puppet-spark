# == Class hive::params
#
# This class is meant to be called from hive
# It sets variables according to platform
#
class spark::params {
  case "${::osfamily}-${::operatingsystem}" {
    /RedHat-Fedora/: {
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
    /Debian|RedHat/: {
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
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $alternatives = $::osfamily ? {
    debian => 'cluster',
    redhat => undef,
  }
  $confdir = "${::osfamily}-${::operatingsystem}" ? {
    /Fedora-RedHat/ => '/etc/hive',
    /Debian|RedHat/ => '/etc/hive/conf',
  }

  $workers = ['127.0.0.1']
  $master = '127.0.0.1'
  
  $master_port = 7077
  $worker_port = 7078
  $master_webui_port = 18080
  $worker_webui_port = 18081
}
