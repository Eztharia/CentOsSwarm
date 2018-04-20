# CentOs - Swarm deploy via Ansible 

"Iaas deploy forn ansible and use Docker"

 # Prerequisites 
    
* [Ansible](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    
* [CentOs7 - Iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso)

* You need to set the correct dns name in hosts file and redifine vars for needed roles before launch the playbook

Download and Unzip the package which contain the following files :

* **hosts** - Put this file in /etc/ansible/hosts

* **playbook.yml** - Your playbook which contain roles

* **roles/** - All roles for configure the servers

* **scripts/** - Folder which contain ks.cfg & a bash script for configure server static ip.

# How it works ! 

1 - Change the hosts file as you need

2 -  Launch playbook

     sudo ansible-playbook playbook.yml -k

(if you need to launch one role at time do the following) 

    ansible-role my_role -i inventory_hostname

———————

Enjoy !!!

