class site24x7::installation_handler {
	exec { 'Install Linux Agent With Proxy':
	  command => "${site24x7::linuxagent::command}",
	  creates => '/opt/site24x7/monagent/bin/monagent',
	  path    => '/bin:/sbin:/usr/bin:/usr/sbin:/opt/.site24x7agent',
		require => File['/opt/.site24x7agent/Linux_Agent.install'],
	  unless  => "/usr/bin/test -d /opt/site24x7/monagent",
	}
}
