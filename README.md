#### Ubuntu 14 and PostGIS Vagrant config setup for [Whathood.in](https://github.com/jimRsmiley/whathood)

This repository is a vagrant configuration for Whathood. After installing Vagrant and running this configuration. Users will will have the full development environment, complete with a running website, for the web application Whathood.in.

#### Installation
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Download and install [Oracle's Virtual Box 4.3](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3), or another [Vagrant supported virtual guest provider](http://docs.vagrantup.com/v2/providers/)
4. Download Virtual Box's Extension Pack
5. clone the repo: `git clone https://github.com/whathood/whathood-vagrant.git ~/whathood-vagrant && cd ~/whathood-vagrant`
6. `vagrant up`
  * NOTE: during provisioning, ignore messages like `dpkg-preconfigure: unable to re-open stdin: No such file or directory`, it's a known bug

### Notes
* under the vagrant install, the directory whathood_src contains the source code mapped to the development environment
* connect to the ubuntu install: `vagrant ssh`
* view the development site at: [http://localhost:8082](http://localhost:8082)
* PostGIS will be up and running with a database name of "whathood" and accessable through port 5433.
