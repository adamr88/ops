FROM kalilinux/kali-last-release@sha256:950a1c068f4e400020be3b0d561159584e729c0c5931a2bd22503479634cd14f

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# note: 'COPY'
ADD bin /usr/local/bin
RUN path-defaults >> /etc/sudoers && apt-update && apt-install \
	# general network utils
	#######################
	binutils \
	ca-certificates \
	curl \
	dnsutils \
	iputils-ping \
	net-tools \
	openvpn \
	socat \
	ssh \
	whois \
	# general quality of life
	#########################
	code-oss \
	file \
	fzf \
	git \
	jq \
	less \
	man-db \
	neovim \
	parallel \
	xsel \
	# kali-meta packges
	####################
	kali-tools-top10 \
	# - aircrack-ng
	# - burpsuite
	# - crackmapexec
	# - hydra
	# - john
	# - metasploit-framework
	# - nmap
	# - responder
	# - sqlmap
	# - wireshark
	# general vuln/exploit utils
	#############################
	exploitdb \
	feroxbuster \
	gospider \
	python2 \
	python3-pip \
	python3-impacket \
	seclists \
	wfuzz \
	# general term & report utils
	#############################
	flameshot \
	html2text \
	rlwrap \
	terminator \
	# kali core utils
	##################
	&& echo "N" | apt-install kali-linux-core \
	# - ftp
	# - kali-defaults
	# - netcat-traditional
	# - openssh-client
	# - openssh-server
	# - parted
	# - sudo
	# - tasksel
	# - tcpdump
	# - tmux
	# - vim-tiny | vim | vim-nox
	# - zsh
	# - zsh-autosuggestions
	# - zsh-syntax-highlighting
	# kali desktop
	###############
	&& echo "N" | apt-install kali-desktop-i3 \
	# - conky
	# - i3
	# - kali-desktop-base
	# -- ?
	# kali-desktop-core
	# - dbus-user-session
	# - firefox-esr | firefox | www-browser
	# - fonts-noto-color-emoji
	# - haveged
	# - kali-archive-keyring
	# - kali-debtags
	# - kali-defaults-desktop
	# - kali-grant-root
	# - kali-menu
	# - kali-themes
	# - xdg-utils
	# - xserver-xorg-legacy
	# - xterm
	# - qt5ct
	# - suckless-tools | dmenu
	# - xorg
	dbus-x11 \
	supervisor \
	x11-xserver-utils \
	x11vnc \
	xinput \
	xvfb \
	# TODO: add ippsec @tjnull playlist tools or equivalent
	#######################################################
	# rdare2 \
	# odat \
	wpscan \
	&& chsh -s /bin/zsh \
	&& apt-clean
