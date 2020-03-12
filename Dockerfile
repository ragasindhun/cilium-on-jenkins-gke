FROM ubuntu
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y curl
RUN apt-get install -y gnupg
RUN apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN  apt-get update
RUN sudo  apt-get install -y kubectl
