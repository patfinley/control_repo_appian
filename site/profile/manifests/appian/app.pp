class profile::appian::app {
  class { 'appian':
    database_name => lookup('profile::appian::app::database_name'),
    username      => lookup('profile::appian::app::username'),
    password      => lookup('profile::appian::app::password'),
    }
  }
