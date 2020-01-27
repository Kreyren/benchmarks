FROM gitpod/workspace-full-vnc:latest

USER root

# Update apt repositories
RUN apt-get update

# Upgrade the image
RUN apt -y upgrade && apt -y dist-upgrade

# Add upstream repo for docker
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Add docker upstream key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Install build dependencies
RUN apt install -y docker-ce docker-ce-cli containerd.io

# Remove apt sources to clean up space
RUN rm -rf /var/lib/apt/lists/*

# Clean-up unneeded packages
RUN apt autoremove -y