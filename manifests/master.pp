# == Class spark::master
#
# spark master.
#
class spark::master {
  include 'spark::master::install'
  include 'spark::master::config'
  include 'spark::master::service'

  Class['spark::master::install'] ->
  Class['spark::master::config'] ~>
  Class['spark::master::service'] ->
  Class['spark::master']
}
