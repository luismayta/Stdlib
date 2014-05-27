#require basic
class php54 {

    package
    {
      "python-software-properties":
        ensure => present,
        require => Exec['php54 apt update']
    }

    #https://launchpad.net/~ondrej/+archive/php5-oldstable
    exec 
    { 
    'add php54 apt-repo':
      command => '/usr/bin/add-apt-repository ppa:ondrej/php5-oldstable -y',
      require => [Package['python-software-properties']],
    }

    exec { "php54 apt update":
      command => 'apt-get update',
    }
}
