## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Images/dthenet.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the four playbook files may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly reliable, in addition to restricting authorized access to the network.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for any changes to the log files + specified locations and system metrics.

The configuration details of each machine may be found below.
| Name                 | Function                        | IP Address                | OS    |
|----------------------|---------------------------------|---------------------------|-------|
| ELK-VM               | Network Watcher/Analysis        | 10.2.0.4                  | Linux |
| Jump-Box-Provisioner | Access Machine into the Network | 40.83.140.44 (10.1.0.4)   | Linux |
| Web-1                | Web Server No.1                 | 104.42.156.102 (10.1.0.5) | Linux |
| Web-2                | Web Server No.2                 | 104.42.156.102 (10.1.0.6) | Linux |
| Web-3                | BACKUP Web Server (No.3)        | 104.42.156.102 (10.1.0.7) | Linux |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. 
Access to this machine is only allowed from the following IP addresses:
- 72.220.255.160 (Please Change this)

Machines within the network can only be accessed by docker continer within Jump-Box-Provisioner.
It's IP Address is 10.1.0.4 and in my build is inside the container named "sharp_borg". Your's should be names something similar.

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|----------------------|
| ELK-VM               | No                  | 10.1.0.4             |
| Jump-Box-Provisioner | Yes                 | 72.220.255.160       |
| Web-1                | No                  | 10.1.0.4             |
| Web-2                | No                  | 10.1.0.4             |
| Web-3                | No                  | 10.1.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
it lessesns the possibility of human error during installation and creates uniformity among machines.

The playbook implements the following tasks:
-Sets the paramater vm.max_map_count to 26144
-Installs docker.io
-Installs Python 3
-Installs Docker(Python)
-Installs the Docker Container with ELK and opens ports 5601,9200,5044 for ELK to use

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Images/docker_ps_output.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-10.1.0.5
-10.1.0.6
-10.1.0.7

We have installed the following Beats on these machines:
-FILEbeats
-METRICbeats

These Beats allow us to collect the following information from each machine:
Filebeats will be collecting log data, such as packet information and access while Metricbeats will provide live system statistics of your network.
Everything should be working well if you go into the discover tab on the right and click on the drop down under "add filter" and see Metricbeat, Filebeat.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Docker_YAML_Deploy.yml file to /etc/ansible directory
- Update the ansible cfg file to include the name of your adminuser as well as your hosts file to make subsections (webserver,ELK) with private IPs of your VMs
- Run the playbook, and navigate to https://[yourelkstackIP]:5601/app/kibana to check that the installation worked as expected.
