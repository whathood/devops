#### Ubuntu 14 and PostGIS Vagrant config setup for [Whathood.in](https://github.com/jimRsmiley/whathood)

This repository is a vagrant configuration for Whathood. After installing Vagrant and running this configuration. Users will will have the full development environment, complete with a running website, for the web application Whathood.in.

### Docker Images

* See [Docker README](docker/README.md) for more details

#### Installation
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Download and install [Oracle's Virtual Box 4.3](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)(5.0 is too new), or another [Vagrant supported virtual guest provider](http://docs.vagrantup.com/v2/providers/)
4. Download Virtual Box's Extension Pack, located on the same page as the 4.3 install
5. clone the repo: `git clone https://github.com/whathood/vagrant.git ~/whathood-vagrant && cd ~/whathood-vagrant`
6. if working off a fork of the repository, edit `provision/config/config.local.yaml` with the repository location
7. run `./bin/vagrant_setup`
  * NOTE: during provisioning, ignore messages like `dpkg-preconfigure: unable to re-open stdin: No such file or directory`, it's a known bug
8. to get access via the command line use the command: `vagrant ssh -c "screen -R"`

Vagrant will copy a directory provision/config/ssh into the vagrant user's home directory, allowing automatic pushes to github.

### Notes

* under the vagrant install, the directory whathood_src contains the source code mapped to the development environment
* connect to the ubuntu install: `vagrant ssh`
* view the development site at: [http://localhost:8082](http://localhost:8082)
* PostGIS will be up and running with a database name of "whathood" and accessable through port 5433.
