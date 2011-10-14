class mysql::backup {

  if ( ! $mysql_backupdir ) {
    $mysql_backupdir = "/var/backups/mysql"
  }

  file {$mysql_backupdir:
    ensure  => directory,
    owner   => "root",
    group   => "root",
    mode    => 755,
    require => Package["mysql"],
  }

  file { "/usr/local/bin/mysql-backup.sh":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 755,
    content => template("mysql/mysql-backup.sh.erb"),
    require => File[$mysql_backupdir],
  }

  cron { "mysql-backup":
    command => "/usr/local/bin/mysql-backup.sh",
    user    => "root",
    hour    => 2,
    minute  => 0,
    require => [File["/usr/local/bin/mysql-backup.sh"]],
  }

}
