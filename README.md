# OS_ansible_client
Docker container with Ansible and modules needed to manage OpenStack.

## Precondition
- Docker service is installed on the client machine. Note that by default package managers of Linux distros often install very old version of the Docker engine. To avoid that, follow instructions in (https://docs.docker.com/install)
- Client machine has got internet connection without need for HTTP proxy.

## Running ready-built container from Dockerhub
Automatically built image of this container is available in Dockerhub.

Basic command to start container:
```
docker run -it jurajama/os_ansible_client
```

Often you want to have SSH agent forwarding working when using Ansible. That is possible when starting with command:
```
docker run -it -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK jurajama/os_ansible_client
```

The run command opens bash session inside the container, press enter once to see the prompt. Try running *"ansible --version"* and *"openstack --version"* to verify that the modules are installed.

When you enter the container, by default you will be root user. However typically you may want to use your own user account so that SSH to target systems works. You can do that by adding user account inside container after startup and then switching as that user. When SSH agent forwarding is used, you shall also change the owner of SSH agent directory.
```
adduser testuser
chown -R testuser:testuser $(dirname $SSH_AUTH_SOCK)
su testuser
cd ~
```

For accessing the cloud, you need "rc-file" that you can download from OpenStack GUI -> Compute -> Access&Security -> API Access -> Download OpenStack RC File. Copy the file on your client machine and run "source filename.sh". Then the environment variables are set so that the OpenStack CLI commands can work, for example *"openstack server list"*.

## Building container yourself
You can build the container yourself from Dockerfile. This is needed if for example you want to add some packages to the image.

Clone repository:
```
git clone https://github.com/jurajama/OS_ansible_client
``` 

Build image:

```
cd OS_ansible_client
docker build -t ansiclient .
```

After this the container can be started with name *ansiclient*:
```
docker run -it ansiclient
```





