class mysql_mmm::config {

  file {'mmm_common_conf':
    ensure  => present,
    path    => '/etc/mysql-mmm/mmm_common.conf',
    content => template("${module_name}/mmm_common.conf.erb"),
    mode    => '0640'
  }
}
