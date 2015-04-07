# == Class spark::common::config
#
# Basic configuration for spark.
#
class spark::common::config {
  file { "${spark::confdir}/spark-env.sh":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    alias   => 'spark_conf/spark-env.sh',
    content => template('spark/spark-env.sh.erb'),
  }
  file { "${spark::confdir}/spark-defaults.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    alias   => 'spark_conf/spark-defaults.conf',
    content => template('spark/spark-defaults.conf.erb'),
  }

  if $spark::workers {
    file { "${spark::confdir}/slaves":
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      alias   => 'spark_conf/slaves',
      content => template('spark/slaves.erb'),
    }
  }
}
