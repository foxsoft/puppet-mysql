class mysql {
  package { 'mysql': ensure => installed }
  package { 'mysql-server': ensure => installed }
  package { 'mysql-devel': ensure => installed }
  
  Service["mysql"] {
    start   => "/sbin/service mysqld start",
    status  => "/sbin/service mysqld status",
    stop    => "/sbin/service mysqld stop",
    restart => "/sbin/service mysqld restart",
    require => Package["mysql-server"]
  }
  
  service {"mysql": ensure => running }
}