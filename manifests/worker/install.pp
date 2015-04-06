# == Class spark::worker::install
#
# Installation of spark worker service.
#
class spark::worker::install {
  include stdlib
  contain spark::common::postinstall

  ensure_packages($spark::packages['worker'])
  Package[$spark::packages['worker']] -> Class['spark::common::postinstall']
}
