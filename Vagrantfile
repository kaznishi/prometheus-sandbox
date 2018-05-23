# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.box = "ubuntu/xenial64"
    prometheus.vm.network "private_network", ip: "192.168.33.100"
    prometheus.vm.network "private_network", ip: "192.168.33.100", virtualbox__intnet: "intnet"
    prometheus.vm.provision "shell", path: "provision/prometheus/init.sh"
  end

  config.vm.define "nodeA1" do |nodeA1|
    nodeA1.vm.box = "ubuntu/xenial64"
    nodeA1.vm.network "private_network", ip: "192.168.33.101"
    nodeA1.vm.network "private_network", ip: "192.168.33.101", virtualbox__intnet: "intnet"
    nodeA1.vm.provision "shell", path: "provision/node/init.sh"
  end

  config.vm.define "nodeA2" do |nodeA2|
    nodeA2.vm.box = "ubuntu/xenial64"
    nodeA2.vm.network "private_network", ip: "192.168.33.102"
    nodeA2.vm.network "private_network", ip: "192.168.33.102", virtualbox__intnet: "intnet"
    nodeA2.vm.provision "shell", path: "provision/node/init.sh"
  end

  config.vm.define "nodeB1" do |nodeB1|
    nodeB1.vm.box = "ubuntu/xenial64"
    nodeB1.vm.network "private_network", ip: "192.168.33.111"
    nodeB1.vm.network "private_network", ip: "192.168.33.111", virtualbox__intnet: "intnet"
    nodeB1.vm.provision "shell", path: "provision/node/init.sh"
  end

  config.vm.define "nodeB2" do |nodeB2|
    nodeB2.vm.box = "ubuntu/xenial64"
    nodeB2.vm.network "private_network", ip: "192.168.33.112"
    nodeB2.vm.network "private_network", ip: "192.168.33.112", virtualbox__intnet: "intnet"
    nodeB2.vm.provision "shell", path: "provision/node/init.sh"
  end

end