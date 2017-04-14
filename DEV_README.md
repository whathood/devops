# install required ansible roles

ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/

### Encrypt and Decrypt Vault

Store the vault pass in ./vpass

encypt with `dev-bin/vault_decrypt_file ansible/group_vars/vault.yml`

### Required ansible variables

* application_env must be defined at runtime

### How do you deploy development?

```
ansible-playbook ansible/plays/provision_ec2.yml -e ansible_ssh_private_key_file=[private_key_file] -e application_env=development
```

### How do you deploy production?

```
ansible-playbook ansible/plays/provision_ec2.yml -e application_env=production -e ansible_ssh_private_key_file=~/.ssh/id_rsa_ec2_tests

```

### How do you run a play on an already provisioned ec2 host?

```
????
```

### After deploying to "staging", how do you associate the production elastic ip?

`ansible-playbook -i hosts ansible/plays/ec2_associate_elastic_ip.yml`

## Vagrant

Provision Vagrant with:

`vagrant up`

Re-run ansible setup in Vagrant with(good for iterating through bad builds):

`vagrant provision --provision-with=ansible`

### How do you re-run a play on a guest set up by Vagrant?

`dev-bin/vagrant_run_play_on_host.sh [play]`

#### With tags

`dev-bin/vagrant_run_play_on_host.sh [play] [-t tag_name]`

### Site Url

Access the site from http://localhost:8080
