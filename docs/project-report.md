# Project Report: Linux Server Administration

## 1. Project Goal

The goal of this project was to deploy and configure a Linux server in a virtualized environment and demonstrate basic system administration skills.

The project included server installation, SSH access configuration, user and group management, firewall setup, Nginx web server deployment, backup automation, cron scheduling, log analysis, basic system monitoring, and application containerization using Docker.

## 2. Environment

The server was deployed in a virtual machine.

**Server configuration:**

* OS: Ubuntu Server
* Virtualization: VirtualBox
* CPU: 2 cores
* RAM: 4 GB
* Disk: 40 GB
* Network mode: NAT with port forwarding

**Configured port forwarding:**

* SSH: Host port 2222 → Guest port 22
* Nginx: Host port 8080 → Guest port 80

## 3. SSH Configuration

SSH was installed and enabled to allow remote server administration from the host machine.

Commands used:

```bash
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```

SSH connection was tested from the host machine:

```bash
ssh umanio@127.0.0.1 -p 2222
```

Result: SSH connection was successfully established.

## 4. User and Group Management

Users and groups were configured to demonstrate Linux access control.

Commands used:

```bash
sudo adduser user1
groups user1
whoami
groups
```

An administrator user has sudo privileges, while a regular user does not have administrative access. This demonstrates the difference between privileged and non-privileged users in Linux.

## 5. Firewall Configuration

UFW firewall was configured to allow only required services.

Commands used:

```bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw enable
sudo ufw status verbose
```

Allowed services:

* SSH
* HTTP/Nginx

Result: firewall was enabled and only required ports were allowed.

## 6. Nginx Web Server

Nginx was installed and configured as a simple web server.

Commands used:

```bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
```

The default web page was replaced with a custom HTML page located at:

```bash
/var/www/html/index.html
```

The web page was tested in the browser using:

```text
[http://127.0.0.1:8080](http://127.0.0.1:8080)
```

Result: the Nginx web page was successfully opened from the host machine.

## 7. Docker Containerization & Application Deployment

An asynchronous Python Telegram Bot (integrated with Google Gemini AI) was deployed to demonstrate application containerization and isolated environment management.

Commands used:

```bash
sudo apt install docker.io docker-compose git -y
sudo usermod -aG docker $USER
git clone https://github.com/umani0/AITelegramBot.git
cd AITelegramBot
docker-compose up -d --build
```

Result: The application image was successfully built and the bot was launched inside an isolated Docker container.

## 8. Security & Environment Variables

To securely pass sensitive API keys (Telegram Bot Token and Gemini API Key) to the containerized application without hardcoding them, a hidden `.env` file was created and passed to the container via `docker-compose.yml`.

Commands used:

```bash
echo -e "TG_TOKEN=your_token\nGEMINI_API_KEY=your_api_key" > .env
```

Result: Sensitive credentials were securely managed and successfully read by the application.

## 9. Backup Automation

A Bash script was created to back up Nginx website files.

Script location:

```bash
/opt/scripts/backup-nginx.sh
```

Backup directory:

```bash
/backup
```

The script archives files from `/var/www/html`.

Command used to test the script:

```bash
sudo /opt/scripts/backup-nginx.sh
```

Result: backup archive was successfully created in the `/backup` directory.

## 10. Cron Task

Cron was configured to automatically run the backup script.

Command used:

```bash
sudo crontab -e
```

Cron task:

```bash
0 2 * * * /opt/scripts/backup-nginx.sh >> /var/log/backup-nginx.log 2>&1
```

This task runs the backup script every day at 02:00 and writes output to the log file.

## 11. Log Analysis & Troubleshooting

System services and application logs were analyzed to ensure proper operation and troubleshoot code errors.

Commands used:

```bash
sudo journalctl -u ssh -n 20
sudo journalctl -u nginx -n 20
sudo tail -n 20 /var/log/nginx/access.log
docker logs ai_telegram_bot
```

Result: SSH, Nginx, and Docker container logs were checked successfully. Container log analysis was utilized to fix Python import errors during deployment.

## 12. System Monitoring

Basic system and container monitoring was performed using Linux command-line tools.

Commands used:

```bash
htop
df -h
free -h
ss -tulnp
docker ps
docker stats
```

These commands were used to check resource usage, active ports, and the health status of running containers.

## 13. Screenshots

The following screenshots were added to the project:

* SSH login
* User and group check
* Nginx status and web page in browser
* UFW firewall status
* Backup result and Cron task
* htop system monitoring
* Docker container status (`docker ps`)
* Docker stats checking (`docker stats`)
* Working Telegram Bot in production

## 14. Skills Demonstrated

This project demonstrates the following skills:

* Linux server installation and CLI administration
* SSH and UFW Firewall configuration
* User and group management
* Nginx web server setup
* Bash scripting and Cron scheduling
* Application deployment using Docker & Docker Compose
* Secure management of environment variables
* Application troubleshooting via container logs
* Basic system monitoring and GitHub project documentation

## 15. Conclusion

As a result of this project, a fully functional Ubuntu Server environment was deployed and configured. The server securely supports SSH access, serves web content via Nginx, and hosts a containerized asynchronous Python application. The infrastructure includes automated backups, strong firewall rules, and robust log monitoring, demonstrating a solid foundation in Linux system administration.
