FROM ops/kali-core

# note: 'COPY'
ADD etc /etc
ADD bin /usr/local/bin
ADD usr/share/scripts /usr/share/scripts

# RUN useradd -m -k /etc/skel/ -ou 0 -g 0 kali && sudo passwd kali &&  echo "password" | passwd --stdin kali

ENV HOME=${HOME:-/root}
RUN echo 'source $HOME/.zprofile' >> $HOME/.zshrc \
	&& zinit-install
WORKDIR $HOME 
