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
