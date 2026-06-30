# linux-server
Ubuntu Server project for understanding how to start Ubuntu Server, using Bash, SSH, UFW Firewall, Nginx, Cron, Fail2Ban, systemd, journalctl, and Docker containerization.

# Project description 
This project demonstrates fundamental Linux server administration and application deployment skills. The server was deployed on a VM. The project includes user management, SSH configuration, firewall setup, Nginx web server deployment, log analysis, monitoring, backup automation, basic security hardening, and deploying a containerized application (AI Telegram Bot).

## Technologies used

- Ubuntu Server
- Bash 
- SSH
- UFW firewall
- Nginx
- Cron
- Fail2Ban
- systemd & journalctl
- Docker & Docker Compose
- Python (aiogram) & Google Gemini API
  
## Implemented Features

- Installed and configured Ubuntu Server
- Created users and groups
- Configured SSH access
- Configured UFW firewall
- Installed and configured Nginx with a custom web page
- Analyzed system and service logs
- Created backup script for Nginx files and automated them using cron
- Monitored CPU, RAM, disk, and network usage
- Deployed an asynchronous AI Telegram Bot inside an isolated Docker container
- Performed container troubleshooting and application log analysis

## Deployed Applications

### AI Telegram Bot
Successfully deployed a custom Telegram bot integrating Google Gemini AI. 
* Process: Cloned from GitHub, built a custom Docker image using a `Dockerfile`, and orchestrated the service using `docker-compose.yml`.
* Troubleshooting: Successfully resolved Python environment issues, missing dependencies, and configured secure secret passing to the isolated container.

## Server Configuration

- OS: Ubuntu Server
- CPU: 2 cores
- RAM: 4 GB
- Disk: 40 GB
- Web Server: Nginx
- Firewall: UFW
- Containerization: Docker
- Backup: Bash + Cron

## Useful Commands

```bash
# System Services
sudo systemctl status nginx
sudo systemctl status ssh
sudo ufw status verbose
journalctl -u nginx
journalctl -u ssh

# Resource Monitoring
df -h
free -h
ss -tulnp

# Docker & Container Management
docker-compose up -d --build
docker-compose down
docker ps
docker logs ai_telegram_bot
docker stats
