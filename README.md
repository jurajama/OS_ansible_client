# OS_ansible_client
Docker container with Ansible and modules needed to manage OpenStack.

<B>Precondition:</B>
- Docker service is installed on the client machine. Note that by default package managers of Linux distros often install very old version of the Docker engine. To avoid that, follow instructions in <A HREF='https://docs.docker.com/install/'>https://docs.docker.com/install/</A>
- Client machine has got internet connection without need for HTTP proxy.

<B>Installation:</B>

Clone repository:
<PRE>git clone https://github.com/jurajama/OS_ansible_client</PRE>

Build image:

<PRE>
cd OS_ansible_client
docker build -t ansiclient .</PRE>

Basic command to start container:
<PRE>docker run -it ansiclient</PRE>

Often you want to have SSH agent forwarding working when using Ansible. That is possible when starting with command:
<PRE>docker run -it -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK ansiclient</PRE>

The run command opens bash session inside the container, press enter once to see the prompt. Try running "ansible --version" and "nova --version" to verify that the modules are installed.

When you enter the container, by default you will be root user. However typically you may want to use your own user account so that SSH to target systems works. You can do that by adding user account inside container after startup:
<PRE>adduser testuser
su testuser</PRE>

For accessing the cloud, you need "rc-file" that you can download from OpenStack GUI -> Compute -> Access&Security -> API Access -> Download OpenStack RC File. Copy the file on your client machine and run "source filename.sh". Then the environment variables are set so that the CLI commands can work.

