class mysql_mmm::monitor (

  $ip               = '127.0.0.1',
  $monitor_user     = 'mmm_monitor',
  $monitor_password = undef,
  $ping_ips         = []

) {

  if ! $monitor_password {
    fail('$$monitor_password params is mandatory')
  }

  if ! is_array($ping_ips) {
    fail('$ping_ips param must be array of IPs')
  }

  anchor {'monitor::begin':
    before => Class['monitor::install']
  }
  class {'monitor::install':
    require => Anchor['monitor::begin']
  }
  class {'monitor::config':
    require => Class['monitor::install']
  }
  class {'monitor::service':
    subscribe => Class['monitor::config']
  }
  anchor {'monitor::end':
    require => Class['monitor::service']
  }
}
