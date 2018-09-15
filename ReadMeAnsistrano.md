## Ansible

**Ansible dependencies**

To manage third-party Ansible roles which are dependencies of our project we use
the requirements file. To install all the dependencies use:

```bash
 ansible-galaxy install -r ansible/requirements.yml
```

**Ansible Vault**

We use Ansible Vault to hold all the sensitive data private. To edit the vault, execute:

```bash
 ansible-vault edit ./ansible/vars/vault.yml
```

And enter the correct password. The password from our vault is `beefpass`.
For your own vaults you would probably use much stronger passwords and keep them secret.

**Create EC2 instance**

You can create a new AWS EC2 instance manually in Amazon dashboard or execute our
`aws.yml` playbook:

```bash
 ansible-playbook ./ansible/aws.yml -i ./ansible/hosts.ini --ask-vault-pass
```

> You also need to set up your own Amazon credentials in Ansible Vault. See above how
to edit the Vault.

**Provision the server**

To provision your servers with Ansible, execute:

```bash
 ansible-playbook ./ansible/playbook.yml -i ./ansible/hosts.ini -l aws --ask-vault-pass
```

Where `aws` is the host name which you want to provision. Also, you need to set up your
server's public IP address in `ansible/hosts.ini`.

**Deploy to production**

To deploy the project to production with Ansistrano, execute:

```bash
 ansible-playbook ./ansible/deploy.yml -i ./ansible/hosts.ini --ask-vault-pass
```