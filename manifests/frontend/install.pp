# == Class spark::frontend::install
#
class spark::frontend::install {
  include stdlib
  contain spark::common::postinstall

  ensure_packages($spark::packages['common'])
  ensure_packages($spark::packages['frontend'])
  
  Package[$spark::packages['common']] -> 
  Package[$spark::packages['frontend']] -> 
  Class['spark::common::postinstall']
}
