class site24x7 (
  String                  $agent_proxy    = '',
  String                  $device_key     = undef,
  Boolean                 $service_enable = true,
  Stdlib::Ensure::Service $service_ensure = 'running',
  ) {

  ## Determine the most appropriate architecture for the installer file
  if $facts[os][architecture] == 'amd64' or 'x86_64' {
    $install_file="Site24x7_Linux_64bit.install"
  } else {
    $install_file="Site24x7_Linux_32bit.install"
  }

  ## Create the installer directory
  file { '/opt/.site24x7agent':
    ensure => directory,
    mode   => '0755',
  }

  ## Download the installer file and ensure it's executable
  exec { 'Download Site24x7 Installer':
    command => "curl https://staticdownloads.site24x7.com//server//$install_file > /opt/.site24x7agent/Linux_Agent.install",
    creates => '/opt/.site24x7agent/Linux_Agent.install',
    notify  => Exec['Install Site24x7 Agent'],
    path    => $::path,
    require => File['/opt/.site24x7agent'],
    unless  => 'test -f /opt/.site24x7agent/Linux_Agent.install',
  }
  file { '/opt/.site24x7agent/Linux_Agent.install':
    mode    => '0755',
    require => Exec['Download Site24x7 Installer'],
  }

  ## Determine if a proxy is being used
  if $agent_proxy != '' {
    $command = "/opt/.site24x7agent/./Linux_Agent.install -i -key=${device_key} -installer=puppet -proxy=${agent_proxy}"
  } else {
    $command = "/opt/.site24x7agent/./Linux_Agent.install -i -key=${device_key} -installer=puppet"
  }

  ## Install agent from installer file
  exec { 'Install Site24x7 Agent':
    command     => $command,
    creates     => '/opt/site24x7/monagent/bin/monagent',
    path        => [$::path,'/opt/.site24x7agent'],
    require     => File['/opt/.site24x7agent/Linux_Agent.install'],
    refreshonly => true,
  }

  ## Manage system service
  service { 'site24x7monagent':
    enable  => $service_enable,
    ensure  => $service_ensure,
    require => Exec['Install Site24x7 Agent'],
  }

}
