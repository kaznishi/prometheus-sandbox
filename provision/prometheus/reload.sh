#!/bin/sh

systemctl restart prometheus.service
systemctl restart alertmanager.service
systemctl restart blackbox_exporter.service
