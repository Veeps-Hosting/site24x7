This Module Features
=====================
- Forked from https://github.com/site24x7/puppet-site24x7/
- Manages the resulting system service and ensures enabled & running by default
- Doesn't download the agent installer or execute commands/notify on every puppet run
- Uses PDK for correct syntax and future proofing

Bulk deployment of Site24x7 Linux agent using Puppet
===========
This puppet recipe installs Site24x7 Server Monitoring agent on Linux platforms.
Please create a Site24x7 account to install the Linux agent using Puppet.

Supported Platforms
============
Linux OSs including Debian and derivatives such as Ubuntu, RedHat and derivatives such as Scientific.

Parameters
============
$device_key = Your device Key is available under the Site24x7 "Add Server Monitor" page. Log In and navigate to Home > Monitors > Click on the (+) icon > Linux Server Monitoring. Site24x7 device key is unique for your account. Alternate device Key can also be generated from your Site24x7 account under Admin > Developer > Device Key.
$agent_proxy = Proxy server required to connect to the Site24x7 servers. Example : user:password@proxyhost:port

Installation Steps
============
1. Download the Site24x7 module into your puppet modules directory from Puppet Forge or https://github.com/Veeps-Hosting/site24x7
2. Set your device key.
3. Set proxy attribute if necessary, eg. $agent_proxy= "user:password@proxyhost:proxyport"
4. Assign classes and run Puppet to install the agent
5. View your servers from your Site24x7 account. https://www.site24x7.com/login.html

Related Links
=====
* [Site24x7 Server Monitoring] (https://www.site24x7.com/server-monitoring.html)
* [Site24x7 Signup] (https://www.site24x7.com/signup.html?pack=5&l=en)
* [Site24x7 Help Documentation] (https://www.site24x7.com/help/admin/adding-a-monitor/linux-server-monitoring.html)

License
=======

(The MIT License)

Copyright © 2015, 2016 Site24x7
Terms of Use (http://www.site24x7.com/terms.html)
Privacy Policy (http://www.site24x7.com/privacypolicy.html)
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
