#!/usr/bin/env bash
# Configure Nginx so that its HTTP response contains
# a custom header
# Add HAProxy PPA
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:vbernat/haproxy-2.5
sudo apt-get -y update

# Install HAProxy
sudo apt-get -y install haproxy
sudo sed -i -e '$aENABLED=1\n' /etc/default/haproxy
sudo sed -i -e '$a\listen http-in\n\tbind :80\n\tbalance roundrobin\n\tserver 93296-web_01 34.204.76.95:80 check\n\tserver 93296-web-02 18.209.223.29:80 check\n' /etc/haproxy/haproxy.cfg
sudo service haproxy restart
