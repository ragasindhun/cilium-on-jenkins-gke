FROM ubuntu
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y curl
RUN apt-get install -y gnupg
# Install docker
RUN sudo apt install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN sudo apt update
RUN apt-cache policy docker-ce
RUN sudo apt install docker-ce
RUN sudo systemctl status docker
# Install kubectl
RUN apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN  apt-get update
RUN sudo  apt-get install -y kubectl