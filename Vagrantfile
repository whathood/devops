# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"
  #config.vm.box_check_update = true

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  #config.vbguest.auto_update = true
  config.vm.network :private_network, ip: "192.168.111.222"

  # under /opt
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # under /home/{{user}}/src/whathood
  config.vm.network :forwarded_port, guest: 8081, host: 8081

  # webgrind
  config.vm.network :forwarded_port, guest: 8082, host: 8082

  config.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 1 
  end

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "ansible/hosts/development"
    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
    ansible.limit = 'development'
    ansible.playbook = "ansible/setup.yml"
  end

end
