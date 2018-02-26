default: provision

provision: ansible-requirements-install ansible-playbook-provision-ec2

ansible-requirements-install:
	ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/

ansible-playbook-provision-ec2:
	ansible-playbook ansible/plays/provision_ec2.yml --ask-vault-pass 
