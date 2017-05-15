class mysql_mmm::monitor::service {

  service { 'mysql-mmm-monitor':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }
}
