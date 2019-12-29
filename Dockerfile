FROM fedora:latest

RUN dnf install -y nano wget libffi-devel python3-devel openssl-devel redhat-rpm-config gcc git python3-virtualenvwrapper findutils net-tools traceroute python3-dnf sshpass sudo

# OpenStack related packages
RUN pip3 install ansible python-openstackclient python-novaclient python-neutronclient python-glanceclient python-cinderclient && \
    pip3 install python-ceilometerclient shade ansible-tools paramiko lxml && \
# Azure related packages
    pip3 install pywinrm packaging msrestazure ansible[azure] && \
# Install latest boto version needed in managing AWS
    pip3 install -U boto && \
# Install google-auth needed in managing Google Cloud Platform with Ansible
    pip3 install google-auth

ENTRYPOINT /bin/bash

