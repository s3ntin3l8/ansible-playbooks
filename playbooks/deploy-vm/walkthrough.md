# Setup Complete!

The SSH keys have been fully configured, the configuration files updated, and the Proxmox provisioning playbook finalized. Here is a review of what was completed so you can start deploying VMs!

## 1. SSH Keys & Agent configuration
- **Public keys generated:** `~/.ssh/id_rsa.pub` and `~/.ssh/id_rsa_github.pub` were created.
- **`~/.ssh/config` optimized:**
    ```ssh-config
    # Personal Key for specific hosts
    Host <PROXMOX_IP> <VM_IP> github.com
        IdentityFile ~/.ssh/id_rsa_github
        IdentitiesOnly yes

    # Default Key for Ansible and all other hosts
    Host *
        IdentityFile ~/.ssh/id_rsa
        IdentitiesOnly yes
    ```

## 2. Playbook Enhancements

I've integrated all of your requests into the `~/ansible-playbook/deploy-vm/` directory:

*   **Dynamic Inventory:** `inventory.proxmox.yml` was created and encrypted with a hidden Vault password (`~/.vault_pass.txt`). You won't have to enter the password manually when you run commands within that directory.
*   **Proxmox API Token:** Added your token `REDACTED` mapped to the secret `REDACTED` inside the vaulted inventory file.
    > [!TIP]
    > To test your dynamic inventory, you can run: 
    > ```bash
    > source ~/ansible-env/bin/activate
    > cd ~/ansible-playbook/deploy-vm
    > ansible-inventory -i inventory.proxmox.yml --graph
    > ```
*   **First-Boot Updates:** Added `package_upgrade: true` to the Cloud-Init template (`user-data.yml.j2`) so fresh deployments run `apt update && apt upgrade` automatically.
*   **QEMU Guest Agent:** Added instructions to Cloud-Init to install and start `qemu-guest-agent`, and enabled it on the VM hardware side via the Ansible playbook using the `--agent 1` flag.
*   **Wait and Extract IP:** The end of the playbook (`playbook.yml`) now pauses, waits for the guest agent to respond, fetches the IPv4 address utilizing QEMU tools, and prints it out to the terminal!

## Execution Commands

You are all set to provision and dynamically manage your VMs! Here are the exact commands you need to run the playbook from within your Python virtual environment:

```bash
# 1. Activate your virtual environment
source ~/ansible-env/bin/activate

# 2. Navigate to your playbook directory
cd ~/ansible-playbook/deploy-vm

# 3. Run the provisioning playbook! 
# (It will automatically use your inventory.ini and decrypt anything using the hidden vault password file)
ansible-playbook playbook.yml
```
