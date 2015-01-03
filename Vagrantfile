# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # might help with these console messages about tty
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = 'ubuntu/trusty64'

  config.vm.synced_folder "./", "/var/vagrant_share", create: true, group: "vagrant, owner: "vagrant"

  # forward so http://localhost:8080 points to the whathood home site
  config.vm.network :forwarded_port, guest: 80, host: 8080
  
  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     # vb.gui = true
     vb.name = "whathood_vm"
     vb.memory = 4024
     vb.cpus = 4
  end

  config.vm.provision "shell" do |s|
    s.path = "provision/setup.sh"
  end
end
