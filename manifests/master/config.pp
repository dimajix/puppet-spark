# == Class spark::master::config
#
# Configuration of spark master service.
#
class spark::master::config {
  contain hadoop::common::yarn::config
  contain spark::common::config
  contain spark::common::daemon
}
