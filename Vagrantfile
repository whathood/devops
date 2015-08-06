# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = "whvagrant"
  config.vm.box_check_update = true

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = true

  # forward so http://localhost:8082 points to the whathood home site
  config.vm.network :forwarded_port, guest: 8081, host: 8082
  config.vm.network :forwarded_port, guest: 5432, host: 5433

  # windows sync is slow, so for the source dir, use rsync
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

 
  # can use the slower windows sync for log files 
  windows_sync_folders = [
    {
      guest: "/var/log/whathood",
      host:  "whathood/log"
    }
  ]

  windows_sync_folders.each { |folders|
    config.vm.synced_folder folders[:host], folders[:guest]
  }
  config.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 1 
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

  config.trigger.after :up do
    run "vagrant rsync-back"
    run "cp provision/config/application_env whathood/src/"
  end

  config.trigger.after :halt do
    run "./bin/killall_plugins"
  end

end
