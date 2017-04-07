Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  #
  # Run Ansible from the Vagrant Host
  #
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/plays/setup.yml"
    ansible.raw_arguments = [
        "-e application_env=development",
        "-e ansible_user=vagrant"
    ]
  end

end
