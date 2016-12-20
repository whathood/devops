### AWS Provisioning and Deployment using Ansible and Docker for [Whathood.in](https://github.com/jimRsmiley/whathood)

This repository is a vagrant configuration for Whathood. After installing Vagrant and running this configuration. Users will will have the full development environment, complete with a running website, for the web application Whathood.in.

### Setup

~~~~
# install required ansible roles

ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/
~~~~

#### See

* [Docker](docker/README.md) - docker containers run all of the programs needed for the Whathood system
* [Ansible](ansible/README.md) - handles the install, configuration and deployment of the Whathood system
