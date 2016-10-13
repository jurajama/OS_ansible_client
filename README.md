# OS_ansible_client
Docker container with Ansible and modules needed to manage OpenStack.

<B>Precondition:</B>
- Docker service is installed on the client machine. Note that by default package managers of Linux distros often install very old version of the Docker engine. To avoid that, follow instructions in <A HREF='https://docs.docker.com/engine/installation/'>https://docs.docker.com/engine/installation/</A>
- Client machine has got internet connection without need for HTTP proxy.

<B>Installation:</B>

Clone repository:
<PRE>git clone https://github.com/jurajama/OS_ansible_client</PRE>

Build image:

<PRE>
cd OS_ansible_client
docker build -t ansiclient .</PRE>

Run image:
<PRE>docker run -it ansiclient</PRE>

The run command opens bash session inside the container, press enter once to see the prompt. Try running "ansible --version" and "nova --version" to verify that the modules are installed.

For accessing the cloud, you need "rc-file" that you can download from OpenStack GUI -> Compute -> Access&Security -> API Access -> Download OpenStack RC File. Copy the file on your client machine and run "source filename.sh". Then the environment variables are set so that the CLI commands can work.
