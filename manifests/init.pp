class site24x7 (
  String $device_key  = '',
  String $agent_proxy = '',
) inherits site24x7::params{
  include site24x7::linuxagent
}
