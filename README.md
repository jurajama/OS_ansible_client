# OS_ansible_client
Docker container with Ansible and modules needed to manage OpenStack.

<B>Precondition:</B>
- Docker service is installed on the client machine.
- Client machine has got internet connection without need for proxy.

<B>Installation:</B>

Clone repository:
<PRE>git clone https://github.com/jurajama/OS_ansible_client</PRE>

Build image:

<PRE>
cd OS_ansible_client
docker build -t ansiclient .</PRE>

Run image:
<PRE>docker run -it ansiclient</PRE>

The run command opens bash session inside the container. Try running "ansible --version" and "nova --version" to verify that the modules are installed.
