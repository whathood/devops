### AWS Provisioning and Deployment using Ansible and Docker for [Whathood.in](https://github.com/jimRsmiley/whathood)

### Setup

~~~~
# install required ansible roles

ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/

ansible-playbook ansible/provision_ec2.yml

~~~~

#### See

* [Docker](docker/README.md) - docker containers run all of the programs needed for the Whathood system
* [Ansible](ansible/README.md) - handles the install, configuration and deployment of the Whathood system
