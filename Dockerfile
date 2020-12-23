FROM ubuntu:20.04
VOLUME ["/mnt/project"]
WORKDIR /mnt/project

ARG NODE_VERSION=14.15.3

ENV CHROME_BIN=/usr/bin/google-chrome-bin
ENV DISPLAY=:99.0
ENV TZ=Europe/Oslo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y \
  apt-utils \
  ca-certificates \
  fonts-liberation \
  g++ \
  libappindicator3-1 \
  libasound2 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libatspi2.0-0 \
  libc6 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libexpat1 \
  libfontconfig1 \
  libgbm1 \
  libgcc1 \
  libgconf-2-4 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libnss3 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxkbcommon0 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  lsb-release \
  make \
  python \
  python3-distutils \
  tar \
  wget \
  xdg-utils \
  xvfb

# NodeJS setup
RUN wget https://nodejs.org/dist/v14.15.3/node-v${NODE_VERSION}.tar.gz -P /tmp
RUN chmod +x /tmp/node-v${NODE_VERSION}.tar.gz
RUN mkdir -p /usr/local/lib/nodejs
RUN tar -zxvf /tmp/node-v${NODE_VERSION}.tar.gz -C /usr/local/lib/nodejs
RUN cd /usr/local/lib/nodejs/node-v${NODE_VERSION} && \
  ./configure && \
  make -j4 && \
  make install
RUN echo "export PATH=/usr/local/lib/nodejs/node-v${NODE_VERSION}/bin:\$PATH" >> ~/.profile
RUN node -v && npm -v

# Chrome setup
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
RUN dpkg -i /tmp/google-chrome*.deb
