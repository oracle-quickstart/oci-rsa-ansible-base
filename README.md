OCI-RSA-Ansible-Base
=========

Installs base packages and sets configuration for general security, monitoring, and auditing purposes.

Installs the following:

- git
- nmap
- chronyd
- suricata
- scipag
- lynis

Requirements
------------
- ansible >= 2.11.0
- Oracle Linux >= 7.9



Role Variables
--------------

    oci_rsa_path: "/opt/oci-rsa"

Path where rsa software is installed. Rsa specific ansible playbooks and scripts are deployed here.

    ansible_playbook_name: "{{ (lookup('file', '/proc/self/cmdline') | regex_replace('\u0000',' ')).split()|select('match','^[a-z-_/]*[.]y[a]*ml')|list|first|basename }}"

Used to schedule a cron job to run the calling playbook. 


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

License
-------

This repository and its contents are licensed under UPL 1.0.
