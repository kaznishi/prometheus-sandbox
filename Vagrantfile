# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "prometheus" do |prometheus|
    prometheus.vm.box = "ubuntu/xenial64"
    prometheus.vm.network "private_network", ip: "192.168.33.100"
    prometheus.vm.network "private_network", ip: "192.168.33.100", virtualbox__intnet: "intnet"

    prometheus.vm.provision "shell", path: "provision/prometheus/init.sh"
  end

end