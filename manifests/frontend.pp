# == Class spark::frontend
#
# Spark frontend / client.
#
class spark::frontend {
  include 'spark::frontend::install'
  include 'spark::frontend::config'

  Class['spark::frontend::install'] ->
  Class['spark::frontend::config'] ->
  Class['spark::frontend']
}

