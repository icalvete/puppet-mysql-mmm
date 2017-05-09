class mysql_mmm::monitor::config {

  file {'mmm_monitor_conf':
    ensure =>  present,
    path =>  '/etc/mysql-mmm/mmm_mon.conf',
    content =>  template("${module_name}/mmm_mon.conf.erb"),
  }
}
