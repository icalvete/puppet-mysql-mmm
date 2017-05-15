class mysql_mmm::agent::service {

  service { 'mysql-mmm-agent':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }
}
