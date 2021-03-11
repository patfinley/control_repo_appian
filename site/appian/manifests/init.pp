class  appian (
  $database_nickname     = 'jdbc/AppianDS',
  $database_name         = 'appian_203',
  $username              = 'admin',
  $password              = 'password',
  $company_domain        = 'appiancorp.com',
)
{
 file{ '/usr/local/appian/conf':
   ensure => directory,
   mode   => '0755',
  }
   $appian_source_hash = {
    'database_nickname' => $database_nickname,
    'database_name'     => $database_name,
    'username'          => $username,
    'password'          => $password,
}

 file{ '/usr/local/appian/conf/tomcatResources.xml':
   content => epp('appian/target.txt.epp', $appian_source_hash),
   require  => File['/usr/local/appian/conf'],
  }
  $appian_properties_hash = {
    'database_nickname' => $database_nickname,
    'fqdn'              => $facts['networking']['fqdn'],
    'company_domain'    => $company_domain,
    
} 
 file{ '/usr/local/appian/conf/custom.properties':
   content => epp('appian/custom.properties.epp', $appian_properties_hash),
   require  => File['/usr/local/appian/conf/tomcatResources.xml'],
  }


}
