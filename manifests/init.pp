class mysql {
  package { 'mysql': ensure => installed }
  
  Service["mysql"] {
    start   => "/sbin/service mysql start",
    status  => "/sbin/service mysql status",
    stop    => "/sbin/service mysql stop",
    restart => "/sbin/service mysql restart",
    require => Package["mysql"],
  }
  
  service {"mysql": ensure => running, require => Package["mysql"] }
}