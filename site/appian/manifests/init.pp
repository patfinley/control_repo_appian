class  appian (
  $database_nickname     = 'jdbc/AppianDS',
  $database_name         = 'appian_203',
  $username              = 'admin',
  $password              = 'password',
  $company_domain        = 'appiancorp.com',
  $directory_appian_home = '/usr/local/appian203/appian',
  $directory_appian_repo = '/usr/local/appian203/repo/appian',
  $directory_appian_backup = '/usr/local/appian203/backup/appian',
)
{
   $appian_source_hash = {
    'database_nickname' => $database_nickname,
    'database_name'     => $database_name,
    'username'          => $username,
    'password'          => $password,
}

 file{ '${direcotory_appian_home}/conf/tomcatResources.xml':
   content => epp('appian/target.txt.epp', $appian_source_hash),
  }
  $appian_properties_hash = {
    'database_nickname' => $database_nickname,
    'fqdn'              => $facts['networking']['fqdn'],
    'company_domain'    => $company_domain,
    
} 
 file{ '${direcotory_appian_home}/conf/custom.properties':
   content => epp('appian/custom.properties.epp', $appian_properties_hash),
   require  => File['${direcotory_appian_home}/conf/tomcatResources.xml'],
  }


}
