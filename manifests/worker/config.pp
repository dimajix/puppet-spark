# == Class spark::worker::config
#
# Configuration of spark worker service.
#
class spark::worker::config {
  contain spark::common::config
  contain spark::common::daemon
}
