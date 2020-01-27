FROM gitpod/workspace-full-vnc:latest

USER root

# Update apt repositories
RUN apt-get update

# Upgrade the image
RUN apt -y upgrade && apt -y dist-upgrade

# Install build dependencies
RUN apt install -y docker

# Remove apt sources to clean up space
RUN rm -rf /var/lib/apt/lists/*

# Clean-up unneeded packages
RUN apt autoremove -y