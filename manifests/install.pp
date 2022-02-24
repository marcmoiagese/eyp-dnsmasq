class dnsmasq::install inherits dnsmasq {

  if($dnsmasq::manage_package)
  {
    package { $dnsmasq::params::package_name:
      ensure => $dnsmasq::package_ensure,
    }
  }

}
