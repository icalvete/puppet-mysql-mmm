class mysql_mmm::monitor::config {

  file {'mmm_monitor_conf':
    ensure  => present,
    path    => '/etc/mysql-mmm/mmm_mon.conf',
    content => template("${module_name}/mmm_mon.conf.erb"),
    mode    => '0640'
  }

  # in order to avoid https://answers.launchpad.net/mysql-mmm/+question/233645
  file {'mmm_agent_lib':
    ensure => present,
    path   => '/usr/share/perl5/MMM/Monitor/Agent.pm',
    source => "puppet:///modules/${module_name}/Agent.pm",
  }
}
