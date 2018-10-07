FROM fedora:latest

RUN dnf install -y nano wget python libffi-devel python-devel openssl-devel redhat-rpm-config gcc git python-virtualenvwrapper findutils qemu-img net-tools procps-ng traceroute python2-dnf
RUN pip install --upgrade pip
# OpenStack related packages
RUN pip install ansible python-openstackclient python-novaclient python-neutronclient python-glanceclient python-cinderclient && \
    pip install python-ceilometerclient shade ansible-tools SecretStorage-Setup keyring && \
# Azure related packages
    pip install pywinrm packaging msrestazure ansible[azure] && \
# Install latest boto version needed in managing AWS
    pip install -U boto

ENTRYPOINT /bin/bash

