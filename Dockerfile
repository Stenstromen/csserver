FROM ubuntu:22.04
RUN $(echo steam steam/question select "I AGREE" | debconf-set-selections) && \
$(echo steam steam/license note '' | debconf-set-selections) && \
dpkg --add-architecture i386 && \
apt update && \
apt -y --fix-broken install \
curl \
wget \
file \
tar \
bzip2 \
gzip \
unzip \
bsdmainutils \
python3 \
util-linux \
ca-certificates \
binutils \
bc \
jq \
tmux \
netcat \
lib32gcc-s1 \
lib32stdc++6 \
libsdl2-2.0-0:i386 \
cpio \
distro-info \
xz-utils \
steamcmd && \
rm -rf /var/lib/apt/lists/* && \
adduser --disabled-password --gecos "" csserver
USER csserver
WORKDIR /home/csserver
RUN wget -O linuxgsm.sh https://linuxgsm.sh && \
chmod +x linuxgsm.sh && \
bash linuxgsm.sh csserver && \
./csserver auto-install
RUN ./csserver start
EXPOSE 27015/udp
EXPOSE 27015/tcp
WORKDIR /home/csserver/serverfiles
CMD ["./hlds_run", "-game", "cstrike", "-strictportbind", "+ip", "0.0.0.0", "-port", "27015", "+clientport", "27005", "+map", "de_dust2", "+servercfgfile", "csserver.cfg", "-maxplayers", "16"]