# puppet-mysql_mmm

Puppet manifest to install and configure mysql-mmm (Multi-Master Replication Manager for MySQL)

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-mysql_mmm.png)](http://travis-ci.org/icalvete/puppet-mysql_mmm)

See [MySQL MMM](http://mysql-mmm.org/doku.php)

## usage

Prepare a master / master replication following [this cookbok](http://mysql-mmm.org/mmm2:guide)

[This masnifest](https://github.com/icalvete/puppet-mysql) could be usefull.


### monitor

master is a hash like this.

```puppet
  {
    db1 => 'master1 name',
    ip1 => 'master1 IP',
    db1 => 'master2 name',
    ip1 => 'master2 IP',
  } 
```

```puppet
node 'monitor' 
  class {'mysql_mmm':
    interface            => 'eth1',
    replication_password => 'password',
    agent_password       => 'password',
    vip_writer           => '10.3.47.138',
    vips_readers         => ['10.3.47.139', '10.3.47.141'],
    masters              => {
      db1 => 'db01',
      ip1 => '10.3.47.136',
      db2 => 'db02',
      ip2 => '10.3.47.137'
    }
 }->
 class {'mysql_mmm::monitor':
   monitor_password => 'password',
   ping_ips         => ['10.3.47.136', '10.3.47.137']
 }
}
```

```puppet
node 'db01' 
  class {'mysql_mmm':
    interface            => 'eth1',
    replication_password => 'password',
    agent_password       => 'password',
    vip_writer           => '10.3.47.138',
    vips_readers         => ['10.3.47.139', '10.3.47.141'],
    masters              => {
      db1 => 'db01',
      ip1 => '10.3.47.136',
      db2 => 'db02',
      ip2 => '10.3.47.137'
    }
 }->
 class {'mysql_mmm::agent':
   host => 'db01'
 }
}
```

```puppet
node 'db02' 
  class {'mysql_mmm':
    interface            => 'eth1',
    replication_password => 'password',
    agent_password       => 'password',
    vip_writer           => '10.3.47.138',
    vips_readers         => ['10.3.47.139', '10.3.47.141'],
    masters              => {
      db1 => 'db01',
      ip1 => '10.3.47.136',
      db2 => 'db02',
      ip2 => '10.3.47.137'
    }
 }->
 class {'mysql_mmm::agent':
   host => 'db02'
 }
}
```

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
