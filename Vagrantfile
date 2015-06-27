# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"
  config.vm.box_check_update = false

  # forward so http://localhost:8080 points to the whathood home site
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
     vb.name = "whathood-vagrant"
     vb.memory = 4096
     vb.cpus = 4
  end

  config.vm.provision "shell" do |s|
    s.path = "provision/setup_vagrant.sh"
  end

  config.vm.provision "shell" do |s|
    s.privileged = false
    s.path = "provision/bin/run_whathood"
  end

  config.vm.provision "shell" do |s|
    s.privileged = false
    s.path = 'provision/finished_provision.sh'
  end

end
