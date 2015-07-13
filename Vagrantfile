# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"
  config.vm.box_check_update = false

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # forward so http://localhost:8082 points to the whathood home site
  config.vm.network :forwarded_port, guest: 8081, host: 8082
  config.vm.network :forwarded_port, guest: 5432, host: 5433

  # Required for NFS to work, pick any local IP
  #config.vm.network :private_network, ip: '192.168.50.50'

  sync_folders = [
    {
      guest: "/home/vagrant/src/whathood",
      host:  "whathood/src"
    }
  ]

  sync_folders.each { |folders|
    config.vm.synced_folder folders[:host], folders[:guest], type: "rsync",
      rsync__auto: true,
      owner: "vagrant",
      group: "vagrant",
      create: false,
      rsync__args: ["--archive"]
  }

  sync_folders = [
    {
      guest: "/var/log/whathood",
      host:  "whathood/log"
    }
  ]

  sync_folders.each { |folders|
    config.vm.synced_folder folders[:host], folders[:guest]
  }
  config.vm.provider "virtualbox" do |vb|
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
