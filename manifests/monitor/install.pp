class mysql_mmm::monitor::install {

  package { 'mysql-mmm-monitor':
    ensure  => present
  }
}
