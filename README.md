#### Ubuntu 14 and PostGIS Vagrant config setup for [Whathood.in](https://github.com/jimRsmiley/whathood)

This repository is a vagrant configuration for Whathood. After installing Vagrant and running this configuration. Users will will have the full development environment, complete with a running website, for the web application Whathood.in.

#### Installation
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Install a virtual host provider(Oracle's VirtualBox is free and is what I used)
3. Follow Vagrant's instructions for setup on that virtual host provider
  * On Windows 7, using Oracle's VirtualBox, in a new project directory, I did:
    - `git clone https://github.com/jimRsmiley/whathood-vagrant.git .`
    - `vagrant box add ubuntu/trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box`
    - `vagrant up`
    - then you can log into the box with 
      * ip `127.0.0.1`
      * port `2222`
      * username `vagrant`
      * password `vagrant`
    - and also view the website at [http://localhost:8080](http://localhost:8080) from your host computer
    - note: during provisioning, ignore messages like `dpkg-preconfigure: unable to re-open stdin: No such file or directory`, it's a known bug


The website will be sitting under /var/www/whathood.

PostGIS will be up and running with a database name of "whathood". You can access it by running the command `/var/www/whathood/bin/init_psql`.
