# == Class spark::master::service
#
class spark::master::service {
  service { $spark::daemons['master']:
    ensure    => 'running',
    enable    => true,
    subscribe => [File['spark_conf/spark-env.sh']],
  }
}
