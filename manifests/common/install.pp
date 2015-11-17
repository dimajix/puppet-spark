# == Class spark::common::install
#
class spark::common::install {
  include stdlib
  contain spark::common::postinstall

  ensure_packages($spark::packages['common'])
  
  Package[$spark::packages['common']] -> 
  Class['spark::common::postinstall']
}
