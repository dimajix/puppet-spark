# == Class spark::master::install
#
# Installation of spark master service.
#
class spark::master::install {
  include stdlib
  contain spark::common::postinstall

  ensure_packages($spark::packages['master'])
  Package[$spark::packages['master']] -> Class['spark::common::postinstall']
}
