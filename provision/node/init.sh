#!/bin/sh

mkdir /root/packages; cd /root/packages
cp /vagrant/provision/node/checksum-sha256.txt /root/packages/checksum-sha256.txt

wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz

sha256sum -c checksum-sha256.txt

tar zxvf node_exporter-0.15.2.linux-amd64.tar.gz

mv node_exporter-0.15.2.linux-amd64 /opt/node_exporter

mkdir /usr/lib/systemd/system
cp /vagrant/provision/node/node_exporter.service /usr/lib/systemd/system/node_exporter.service

chmod 644 /usr/lib/systemd/system/node_exporter.service

systemctl enable node_exporter.service
systemctl start node_exporter.service

#################################
# for blackbox_exporter test
#################################

sed -i.bak -e "s%http://us.archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
apt-get update && apt-get install -y nginx
