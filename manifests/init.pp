class mysql_mmm (

  $interface            = $mysql_mmm::params::interface,
  $replication_user     = 'replication',
  $replication_password = undef,
  $agent_user           = 'mmm_agent',
  $agent_password       = undef,
  $monitor_user         = 'mmm_monitor',
  $monitor_password     = undef,
  $masters              = {},
  $vip_writer           = undef,
  $vips_readers         = []


) inherits mysql_mmm::params {

  if ! $vip_writer or ! is_ip_address($vip_writer) {
    fail('$vip_writer param must be an IP.')
  }

  if ! is_array($vips_readers) {
    fail('$vips_readers param must be array of IPs')
  }

  if ! $replication_password {
    fail('$replication_password param is mandatory.')
  }

  if ! $agent_password {
    fail('$agent_password param is mandatory.')
  }

  if ! is_hash($masters) {
    fail('$masters params must be a hash like {db1 => "s1", ip1 => "192.168.0.1", db2 => "s2", ip2 => "192.168.0.2"}')
  }

  anchor {'mysql_mmm::begin':
    before => Class['mysql_mmm::install']
  }
  class {'mysql_mmm::install':
    require => Anchor['mysql_mmm::begin']
  }
  class {'mysql_mmm::config':
    require => Class['mysql_mmm::install']
  }
  anchor {'mysql_mmm::end':
    require => Class['mysql_mmm::config']
  }
}
