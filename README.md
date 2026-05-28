# linux-server
Ubuntu Server project for understanding how to start Ubuntu Server, using Bash, SSH, UFW Firewall, Nginx, Cron, Fail2Ban, systemd and journalctl
# Project description 
This mini-project demonstrates basic Linux server administration skills. The server was deployed on a VM. The project includes user management, SSH configuration, firewell setup, Nginx web server deployment, log analysis, monitoring, backup automation and basic security hardening.

## Technologies used

- Ubuntu server
- Bash 
- SSH
- UFW firewall
- Nginx
- Cron
- Fail2Ban
- systemd
- journalctl
  
## Implemented Features

- Installed and configured Ubuntu Server
- Created users and groups
- Configured SSH access
- Configured UFW firewall
- Installed and configured Nginx
- Created a custom web page
- Analyzed system and service logs
- Created backup script for Nginx files
- Automated backups using cron
- Monitored CPU, RAM, disk and network usage

## Server Configuration

- OS: Ubuntu Server
- CPU: 2 cores
- RAM: 4 GB
- Disk: 40 GB
- Web Server: Nginx
- Firewall: UFW
- Backup: Bash + Cron

## Useful Commands

bash```
sudo systemctl status nginx
sudo systemctl status ssh
sudo ufw status verbose
journalctl -u nginx
journalctl -u ssh
df -h
free -h
ss -tulnp
```
