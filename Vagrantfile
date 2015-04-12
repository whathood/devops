# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "America/New_York"
  end


  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"

  # forward so http://localhost:8080 points to the whathood home site
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     # vb.gui = true
     vb.name = "whathood_vm"
     vb.memory = 4096
     vb.cpus = 4
  end

  config.vm.provision "shell" do |s|
    s.path = "provision/setup_vagrant.sh"
  end

end
