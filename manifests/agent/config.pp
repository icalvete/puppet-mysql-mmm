class mysql_mmm::agent::config {

  file {'mmm_agent_conf':
    ensure =>  present,
    path =>  '/etc/mysql-mmm/mmm_agent.conf',
    content =>  template("${module_name}/mmm_agent.conf.erb"),
  }
}
