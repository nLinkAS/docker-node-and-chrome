FROM node:12

RUN apt-get update

# Install chrome
RUN apt-get -y install \
  fonts-liberation \
  libasound2 \
  libatk-bridge2.0-0 \
  libatspi2.0-0 \
  libdrm2 \
  libgbm1 \
  libgtk-3-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxkbcommon0 \
  xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt -y install ./google-chrome-stable_current_amd64.deb
