class profile::appian::app {
  class { 'appian':
    database_nickname      => lookup('profile::appian::app::database_nickname'),
    database_name          => lookup('profile::appian::app::database_name'),
    username               => lookup('profile::appian::app::username'),
    password               => lookup('profile::appian::app::password'),
    company_domain         => lookup('profile::appian::app::company_domain'),
    }
  }
