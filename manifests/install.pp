class mysql_mmm::install {

  package { 'mysql-mmm-common':
    ensure  => present
  }
}
