#!/usr/bin/env bash
cd /etc/nixos
sudo git pull origin main
sudo nixos-rebuild switch