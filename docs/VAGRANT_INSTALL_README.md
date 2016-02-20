#### Installation

1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Download and install [Oracle's Virtual Box 4.3](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)(5.0 is too new), or another [Vagrant supported virtual guest provider](http://docs.vagrantup.com/v2/providers/)
4. Download Virtual Box's Extension Pack, located on the same page as the 4.3 install
5. clone the repo: `git clone https://github.com/whathood/vagrant.git ~/whathood-vagrant && cd ~/whathood-vagrant`
6. if working off a fork of the repository, edit `provision/config/config.local.yaml` with the repository location
7. run `./bin/vagrant_setup`
  * NOTE: during provisioning, ignore messages like `dpkg-preconfigure: unable to re-open stdin: No such file or directory`, it's a known bug
8. to get access via the command line use the command: `vagrant ssh`
