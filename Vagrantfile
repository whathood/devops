# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"

  config.vm.network :private_network, ip: "192.168.111.222"
  config.vm.network "forwarded_port", guest: 22, host: 2223,
    auto_correct: true

  config.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 1 
  end

  config.vm.synced_folder "docker/", "/home/vagrant/src/docker"

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "ansible/hosts/development"
    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
    ansible.limit = 'development'
    ansible.playbook = "ansible/setup.yml"
  end

end
