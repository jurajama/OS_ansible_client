FROM fedora:24

RUN dnf install -y nano wget python libffi-devel python-devel openssl-devel redhat-rpm-config gcc git python-virtualenvwrapper findutils qemu-img net-tools procps-ng traceroute
RUN pip install --upgrade pip
RUN pip install ansible python-openstackclient python-novaclient python-neutronclient python-glanceclient python-cinderclient python-ceilometerclient shade ansible-tools SecretStorage-Setup keyring

ENTRYPOINT /bin/bash

