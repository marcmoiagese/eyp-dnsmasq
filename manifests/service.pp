class dnsmasq::service inherits dnsmasq {

  #
  validate_bool($dnsmasq::manage_docker_service)
  validate_bool($dnsmasq::manage_service)
  validate_bool($dnsmasq::service_enable)

  validate_re($dnsmasq::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${dnsmasq::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $dnsmasq::manage_docker_service)
  {
    if($dnsmasq::manage_service)
    {
      service { $dnsmasq::params::service_name:
        ensure => $dnsmasq::service_ensure,
        enable => $dnsmasq::service_enable,
      }
    }
  }
}
