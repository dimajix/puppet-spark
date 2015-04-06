# == Class spark::worker::service
#
class spark::worker::service {
  service { $spark::daemons['worker']:
    ensure    => 'running',
    enable    => true,
    subscribe => [File['spark_conf/spark-env.sh']],
  }
}
