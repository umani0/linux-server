# Project Report: Linux Server Administration

## 1. Project Goal

The goal of this project was to deploy and configure a Linux server in a virtualized environment and demonstrate basic system administration skills.

The project included server installation, SSH access configuration, user and group management, firewall setup, Nginx web server deployment, backup automation, cron scheduling, log analysis and basic system monitoring.

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

An administrator user has sudo privileges, while a regular user does not have administrative access.

This demonstrates the difference between privileged and non-privileged users in Linux.

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
http://127.0.0.1:8080
```

Result: the Nginx web page was successfully opened from the host machine.

## 7. Backup Automation

A Bash script was created to back up Nginx website files.

Script location:

```bash
/opt/scripts/backup-nginx.sh
```

Backup directory:

```bash
/backup
```

The script archives files from:

```bash
/var/www/html
```

Command used to test the script:

```bash
sudo /opt/scripts/backup-nginx.sh
```

Result: backup archive was successfully created in the `/backup` directory.

## 8. Cron Task

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

Cron task was checked with:

```bash
sudo crontab -l
```

## 9. Log Analysis

System and service logs were checked using `journalctl` and log files.

Commands used:

```bash
sudo journalctl -u ssh -n 20
sudo journalctl -u nginx -n 20
sudo tail -n 20 /var/log/nginx/access.log
sudo journalctl -u cron -n 20
```

Result: SSH, Nginx and cron logs were checked successfully.

## 10. System Monitoring

Basic system monitoring was performed using Linux command-line tools.

Commands used:

```bash
htop
df -h
free -h
uptime
ss -tulnp
```

These commands were used to check:

* CPU usage
* RAM usage
* disk usage
* system uptime
* active network ports
* running processes

## 11. Screenshots

The following screenshots were added to the project:

* SSH login
* User and group check
* Nginx status
* Nginx page in browser
* UFW firewall status
* Backup result
* Cron task
* Nginx logs
* htop system monitoring

## 12. Skills Demonstrated

This project demonstrates the following skills:

* Linux server installation
* Command-line administration
* SSH configuration
* User and group management
* Sudo permissions
* Firewall configuration with UFW
* Nginx web server setup
* Bash scripting
* Backup automation
* Cron scheduling
* Log analysis
* Basic system monitoring
* GitHub project documentation

## 13. Conclusion

As a result of this project, a working Ubuntu Server environment was deployed and configured. The server supports SSH access, runs an Nginx web server, has a configured firewall, includes user and group management, performs automated backups through cron and provides basic log analysis and system monitoring.

