FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update && apt-get install -y ansible nano wget

RUN apt-get install -y python-pip python-dev libffi-dev libssl-dev
RUN pip install pytz shade warlock==1.2.0 functools32 futures
RUN pip install oslo.config six --upgrade

ENTRYPOINT /bin/bash
