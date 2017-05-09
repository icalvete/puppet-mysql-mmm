class mysql_mmm::agent::install {

  package { 'mysql-mmm-agent':
    ensure  => present
  }
}
