# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.box = "ubuntu/xenial64"
    prometheus.vm.network "private_network", ip: "192.168.33.100"
    prometheus.vm.network "private_network", ip: "192.168.33.100", virtualbox__intnet: "intnet"
    prometheus.vm.provision "shell", path: "provision/prometheus/init.sh"
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "ubuntu/xenial64"
    node1.vm.network "private_network", ip: "192.168.33.101"
    node1.vm.network "private_network", ip: "192.168.33.101", virtualbox__intnet: "intnet"
    node1.vm.provision "shell", path: "provision/node/init.sh"
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "ubuntu/xenial64"
    node2.vm.network "private_network", ip: "192.168.33.102"
    node2.vm.network "private_network", ip: "192.168.33.102", virtualbox__intnet: "intnet"
    node2.vm.provision "shell", path: "provision/node/init.sh"
  end

end