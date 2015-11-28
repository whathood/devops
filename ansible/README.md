# Ansible Setup of Whathood

Ansible is used to setup the development environment and deploy code updates for both
development and production.

### Roles

#### prep_docker_env

Pulls all images that will be needed

#### Docker containers

##### docs

An nginx container that serves static files from $HOME/src/whathood/docs

##### phpdocs

Can be re-built with the command in the source code `d-bin/phpdoc_run`

### Tags

`./run_play setup --tags=[tags]`

available tags:

codo - builds the codo coffeescript documentation

docs - builds codo, phpdoc and launches an nginx container

### See Also

[Vagant configuration](VAGRANT_README.md) for accessing resources.
