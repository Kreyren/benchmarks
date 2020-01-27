FROM gitpod/workspace-full-vnc:latest

USER root

RUN printf '%s\n' \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  >> /etc/apt/sources.list

# Add docker upstream key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN groupadd docker

RUN usermod -aG docker gitpod

# Update apt repositories
RUN apt-get update

# Upgrade the image
RUN apt -y upgrade && apt -y dist-upgrade

# Install build dependencies
RUN apt install -y docker-ce docker-ce-cli containerd.io

RUN service docker start

# Remove apt sources to clean up space
RUN rm -rf /var/lib/apt/lists/*

# Clean-up unneeded packages
RUN apt autoremove -y