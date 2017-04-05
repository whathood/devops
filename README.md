[![Build Status](https://travis-ci.org/whathood/devops.svg?branch=master)](https://travis-ci.org/whathood/devops)

### AWS Provisioning and Deployment using Ansible and Docker for [Whathood.in](https://github.com/jimRsmiley/whathood)

### Setup

* set the AWS credentials environment variables
* set the ansible vault password in the file `vpass`

~~~~
# install required ansible roles

ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/

ansible-playbook ansible/plays/provision_ec2.yml -e ansible_ssh_private_key_file=[private_key_file]

~~~~

### Running more ansible plays after provisioning

Add the new host to the hosts file like so:

```
[ip address] ansible_ssh_private_key_file=[private key file]
```

#### See

* [Docker](docker/README.md) - docker containers run all of the programs needed for the Whathood system
* [Ansible](ansible/README.md) - handles the install, configuration and deployment of the Whathood system
