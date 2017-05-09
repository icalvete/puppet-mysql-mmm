class mysql_mmm::agent (

  $host = $hostname

) {

  anchor {'agent::begin':
    before => Class['agent::install']
  }
  class {'agent::install':
    require => Anchor['agent::begin']
  }
  class {'agent::config':
    require => Class['agent::install']
  }
  class {'agent::service':
    subscribe => Class['agent::config']
  }
  anchor {'agent::end':
    require => Class['agent::service']
  }
}
