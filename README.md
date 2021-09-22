OCI-RSA-ANSIBLE-BASE
=========

Installs base packages and sets configuration for general security, monitoring, and auditing purposes.

Provides common functionality and configuration for the following RSA playbooks:
- [oci-rsa-ansible-wazuh](PLACEHOLDER)
- [oci-rsa-ansible-wazuh-kibana](PLACEHOLDER)
- [oci-rsa-ansible-wazuh-odfe](PLACEHOLDER)
- [oci-rsa-ansible-bastion](PLACEHOLDER)

Installs and configures packages with the goal of building a secure computing environment. 

Example-
- nmap
- chronyd
- suricata
- scipag
- lynis


Requirements
------------
- [Ansible core](https://docs.ansible.com/ansible-core/devel/index.html) >= 2.9.x
- [Oracle Autonomous Linux](https://www.oracle.com/linux/autonomous-linux/) >= 7.9


Role Variables
--------------
Path where RSA software is installed. RSA specific ansible playbooks and scripts are deployed here.
```
oci_rsa_path: "/opt/oci-rsa"
```

Used to schedule a cron job to run the calling playbook. Example: oci-rsa-ansible-wazuh.
We have set the default value to automatically fetch the playbook name.
```
ansible_playbook_name: "{}"
```

Optional Variable
--------------
This is an optional variable set inside `extra_variables.yml`. The backing up of resource inventory to object storage only 
runs if this variable is defined.
```
resource_bucket_name
```

Dependencies
------------
Ansible roles used by this role

- clamd_configuration: configures clamscan through scan.conf template
- wazuh_agent_configuration: configures wazuh agent local file scanning

Example Playbook
----------------
Use this role before any of the other RSA roles as it activates the epel repo.

    - hosts: all
      roles: 
        - role: oci-rsa-ansible-base
          become: true

The Team
---------
This repository was developed by the Oracle OCI Regulatory Solutions and Automation (RSA) team. 

How to Contribute
----------------
Interested in contributing?  See our contribution [guidelines](CONTRIBUTE.md) for details.

License
-------
This repository and its contents are licensed under [UPL 1.0](LICENSE).
