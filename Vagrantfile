# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "America/New_York"
  end

  # might help with these console messages about tty
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = 'ubuntu/trusty64'

  # forward so http://localhost:8080 points to the whathood home site
  config.vm.network :forwarded_port, guest: 80, host: 8080
  
  # create a dev site on port 81  
  config.vm.network :forwarded_port, guest: 81, host: 8081

  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     # vb.gui = true
     vb.name = "whathood_vm"
     vb.memory = 1024
     vb.cpus = 1
  end

  config.vm.provision "shell" do |s|
    s.path = "provision/setup_vagrant.sh"
  end
  
end
