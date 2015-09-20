# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"
  #config.vm.box_check_update = true

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # forward so http://localhost:8082 points to the whathood home site
  config.vm.network :forwarded_port, guest: 8081, host: 8082, auto_correct: true

  # webgrind
  config.vm.network :forwarded_port, guest: 8083, host: 8083, auto_correct: true

  config.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 1 
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./provision/whathood_setup.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./provision/whathood_deploy.yml"
  end
end
