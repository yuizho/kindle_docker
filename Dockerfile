FROM ubuntu:22.10

RUN apt update
RUN apt install -y --no-install-recommends wget ca-certificates
RUN dpkg --add-architecture i386

# https://wiki.winehq.org/Ubuntu
RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/kinetic/winehq-kinetic.sources
RUN apt update
RUN apt install -y --install-recommends winehq-stable
RUN apt install -y --no-install-recommends winetricks
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*
RUN groupadd -g 2000 wineuser
RUN useradd -m -u 2000 -g 2000 -s /bin/bash wineuser

USER wineuser
WORKDIR /home/wineuser

RUN mkdir -p ~/.cache/wine
RUN mkdir -p ~/.wine/drive_c/users/wineuser/AppData/Local/Amazon/Kindle
RUN wget -nc --trust-server-names http://www.amazon.co.jp/kindlepcdownload
