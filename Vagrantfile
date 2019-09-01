Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port", guest: 80, host: 8081, auto_currect: true

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  #
  # Run Ansible from the Vagrant Host
  #
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/plays/provision-vagrant.yml"
    ansible.compatibility_mode = "2.0"
    ansible.raw_arguments = [
        "-e application_env=vagrant",
        "-e ansible_user=vagrant"
    ]
    ansible.host_vars = {
        "default" => {
            "ansible_python_interpreter" => "/usr/bin/python3"
        }
    }
  end

end