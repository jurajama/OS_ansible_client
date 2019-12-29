FROM fedora:latest

RUN dnf install -y nano wget python libffi-devel python-devel openssl-devel redhat-rpm-config gcc git python-virtualenvwrapper findutils net-tools traceroute python2-dnf sshpass sudo

RUN pip install --upgrade pip && \
# OpenStack related packages
    pip install ansible python-openstackclient python-novaclient python-neutronclient python-glanceclient python-cinderclient && \
    pip install python-ceilometerclient shade ansible-tools SecretStorage-Setup keyring paramiko lxml && \
# Azure related packages
    pip install pywinrm packaging msrestazure ansible[azure] && \
# Install latest boto version needed in managing AWS
    pip install -U boto && \
# Install google-auth needed in managing Google Cloud Platform with Ansible
    pip install google-auth

ENTRYPOINT /bin/bash

