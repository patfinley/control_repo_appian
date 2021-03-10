class  appian (
  $database_nickname     = 'jdbc/AppianDS',
  $database_name         = 'appian_203',
  $username              = 'admin',
  $password              = 'password',
  $company_domain        = 'appiancorp.com',
)
{
   $appian_source_hash = {
    'database_nickname' => $database_nickname,
    'database_name'     => $database_name,
    'username'          => $username,
    'password'          => $password,
}

 file{ '/etc/target.txt':
   content => epp('appian/target.txt.epp', $appian_source_hash),
   before  => File['/etc/custom.properties'],
  }
  $appian_properties_hash = {
    'database_nickname' => $database_nickname,
    'fqdn'              => $facts['networking']['fqdn'],
    'company_domain'    => $company_domain,
    
} 
 file{ '/etc/custom.properties':
   content => epp('appian/custom.properties.epp', $appian_properties_hash)
  }


}
