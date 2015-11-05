# == Class spark::common
#
# Spark common code (for datanodes).
#
class spark::common {
  include 'spark::common::install'
  include 'spark::common::config'

  Class['spark::common::install'] ->
  Class['spark::common::config'] ->
  Class['spark::common']
}

