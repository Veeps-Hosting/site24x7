class site24x7::download_handler {


	exec { 'Site24x7 Linux Agent':
    command => "curl https://staticdownloads.site24x7.com//server//${site24x7::linuxagent::install_file} > /opt/.site24x7agent/Linux_Agent.install",
  	creates => '/opt/.site24x7agent/Linux_Agent.install',
    notify  => File["/opt/.site24x7agent/Linux_Agent.install"],
	  path    => $::path,
    require => File["/opt/.site24x7agent"]
  	unless  => "/usr/bin/test -f /opt/.site24x7agent/Linux_Agent.install",
	}

  file { '/opt/.site24x7agent':
    before => Exec['Site24x7 Linux Agent'],
	  ensure => directory,
	  mode   => '0755',
	}
	file { '/opt/.site24x7agent/Linux_Agent.install':
    mode => '0755',
	}

}
