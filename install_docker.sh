#! /bin/bash
# 1. install docker environment
# refer: https://docs.docker.com/engine/install/
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ "$(systemctl status docker | grep Active | awk '{ print $2 }')" ==  "active" ];then
  echo "docker is running and skip install docker" 
else
  if [ "`cat /etc/os-release | grep CentOS`" ]; then
  # centos
  yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
  yum install -y yum-utils
  yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo
  yum install -y docker-ce docker-ce-cli containerd.io firewalld
  systemctl start docker

  elif [ "`cat /etc/os-release | grep Debian`" ]; then
  # debian
  # apt-get remove docker docker-engine docker.io containerd runc
  apt-get update
  apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg \
      lsb-release \
      firewalld
   curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io
  else
    echo "OS not supported, please install docker and docker-compose by your self."
    exit 1
  fi
fi

# install docker-compose
if [ ! -f /usr/local/bin/docker-compose ]
then
  #curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
fi
chmod +x /usr/local/bin/docker-compose

