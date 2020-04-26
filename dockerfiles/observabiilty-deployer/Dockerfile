FROM ubuntu:18.04
ADD https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb /tmp/packages-microsoft-prod.deb
ADD https://download.docker.com/linux/ubuntu/gpg /tmp/docker-key.gpg
RUN  apt update \
  && apt install -y ca-certificates software-properties-common \
  && apt-key add /tmp/docker-key.gpg \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
  && apt update \
  && apt install -y docker-ce-cli \
  && dpkg -i /tmp/packages-microsoft-prod.deb \
  && apt update \
  && apt install -y powershell
WORKDIR /opt/scripts
CMD ["pwsh"]