class profile::appian::app {
  class { 'appian':
    database_nickname        => lookup('profile::appian::app::database_nickname'),
    database_name            => lookup('profile::appian::app::database_name'),
    username                 => lookup('profile::appian::app::username'),
    password                 => lookup('profile::appian::app::password'),
    company_domain           => lookup('profile::appian::app::company_domain'),
    directory_appian_home    => lookup('profile::appian::app::directory_appian_home'),
    directory_appian_repo    => lookup('profile::appian::app::directory_appian_repo'),
    directory_appian_backup  => lookup('profile::appian::app::directory_appian_backup'),
    environment              => lookup('profile::appian::app::environment'),


    }
  }
