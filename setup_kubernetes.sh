#!/bin/bash

# This file shows all commands used to setup kubernetes so that it can be later automated with ansible
master1_ip="192.168.6.73"
master1_user="peter"

sudo apt update
sudo apt upgrade
sudo apt install vim iptables -y

# sudo echo "cgroup_enable=memory swapaccount=1 cgroup_memory=1 cgroup_enable=cpuset" >> /boot/firmware/cmdline.txt

sudo iptables -F

# configure static ip?

sudo reboot now

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s -

kubectl get nodes # verify node is up and running

token=sudo cat /var/lib/rancher/k3s/server/node-token

#ssh into next node
# is  K3S_KUBECONFIG_MODE="644" needed for another server node?
curl -sfL https://get.k3s.io | K3S_TOKEN="$token" K3S_URL="https://$master1_ip:6443" K3S_NODE_NAME="node2" sh -s -

#done setting up other nodes

# Rancher setup (optional), not recommended tbh since it has EULA
#ubuntu vm with 4gb ram
sudo apt update
sudo apt upgrade
sudo apt install vim -y
sudo mkdir /etc/rancher
sudo mkdir /etc/rancher/rke2
sudo vim config.yaml
###
token: picluster
tls-san:
	- $master1_ip
###
curl -sfL https://get.rancher.io | sh -
rancherd --help # ensure installed properly
systemctl enable rancherd-server.service
systemctl start rancherd-server.service
rancherd reset-admin
# copy server ip when shown
# click add cluster button in top right
# click other cluster
# go to master1 terminal
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user "$master1_user"
# use unsecured command from rancher since no ssl certificate
# if command fails just try it again and it should work
# go to rancher gui
#click on dots for pi cluster
# click view in api
# click edit
#change agentImageOverride -> rancher/rancher-agent:v2.5.8-linux-arm64
#scroll down click show request
# scroll down click send request make sure it is good
# close popup ui element and verify cluster is good
### Done with rancher install

# File simple nginx server yaml at https://youtu.be/X9fSMGkjtug?si=M3yJsLlLELbwP4K_&t=2132

#TODO: ...