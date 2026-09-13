#!/bin/bash

sudo ufw allow ssh
sudo ufw deny http
sudo ufw allow https
sudo ufw deny ftp
sudo ufw enable
sudo ufw status verbose
