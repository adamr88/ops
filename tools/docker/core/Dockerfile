FROM ops/kali-base

ENV VNC_PORT=${VNC_PORT:-5900}

# note: 'COPY'
ADD etc /etc
ADD bin /usr/local/bin

EXPOSE ${VNC_PORT} 
CMD supervisord
