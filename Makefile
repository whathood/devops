default: init provision

init: git-submodule-update

provision: ansible-requirements-install ansible-playbook-provision-ec2

git-submodule-update:
	git submodule update --init --recursive

ansible-requirements-install:
	ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/

ansible-playbook-provision-ec2:
	ansible-playbook ansible/plays/provision_ec2.yml -e application_env=production

mac-dev-init:
	sudo pip install boto