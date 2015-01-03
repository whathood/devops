#### Vagrant config setup for [Whathood.in](http://whathood.in)

#### Installation
1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Follow instructions for setup
  * I did:
    - in the git directory `vagrant box add ubuntu/trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box`
    - `vagrant up`
    - then you can log into the box with 
      * ip `127.0.0.1`
      * port `2222`
      * username `vagrant`
      * password `vagrant`
    - and view the website at [http://localhost:8080](http://localhost:8080)