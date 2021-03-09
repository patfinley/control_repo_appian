class  appian (
  $database_name         = 'appian_203',
  $username              = 'admin',
  $password              = 'password',
)
{
   $appian_source_hash = {
    'database_name'  => $database_name,
    'username'       => $username,
    'password'       => $password,
}

 file{ '/etc/target.txt':
   content => epp('appian/target.txt.epp', $appian_source_hash)
  }


}
