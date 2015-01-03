#### Vagrant config setup for [Whathood.in](http://whathood.in) [jimrsmiley/Whathood.git](https://github.com/jimRsmiley/whathood)

#### Installation
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Follow instructions for setup
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