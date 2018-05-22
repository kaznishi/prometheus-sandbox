#!/bin/sh

mkdir /root/packages; cd /root/packages
cp /vagrant/provision/prometheus/checksum-sha256.txt /root/packages/checksum-sha256.txt

wget https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-2.2.1.linux-amd64.tar.gz
wget https://github.com/prometheus/alertmanager/releases/download/v0.14.0/alertmanager-0.14.0.linux-amd64.tar.gz
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.12.0/blackbox_exporter-0.12.0.linux-amd64.tar.gz

sha256sum -c checksum-sha256.txt

tar zxvf prometheus-2.2.1.linux-amd64.tar.gz
tar zxvf alertmanager-0.14.0.linux-amd64.tar.gz
tar zxvf blackbox_exporter-0.12.0.linux-amd64.tar.gz

mv prometheus-2.2.1.linux-amd64 /opt/prometheus
mv alertmanager-0.14.0.linux-amd64 /opt/alertmanager
mv blackbox_exporter-0.12.0.linux-amd64 /opt/blackbox_exporter

ln -sf /vagrant/provision/prometheus/prometheus.yml /opt/prometheus/prometheus.yml
ln -sf /vagrant/provision/prometheus/alertmanager.yml /opt/alertmanager/alertmanager.yml
ln -sf /vagrant/provision/prometheus/blackbox.yml /opt/blackbox_exporter/blackbox.yml

mkdir /usr/lib/systemd/system
cp /vagrant/provision/prometheus/prometheus.service /usr/lib/systemd/system/prometheus.service
cp /vagrant/provision/prometheus/alertmanager.service /usr/lib/systemd/system/alertmanager.service
cp /vagrant/provision/prometheus/blackbox_exporter.service /usr/lib/systemd/system/blackbox_exporter.service

chmod 644 /usr/lib/systemd/system/prometheus.service
chmod 644 /usr/lib/systemd/system/alertmanager.service
chmod 644 /usr/lib/systemd/system/blackbox_exporter.service

systemctl enable prometheus.service
systemctl enable alertmanager.service
systemctl enable blackbox_exporter.service

systemctl start prometheus.service
systemctl start alertmanager.service
systemctl start blackbox_exporter.service
