FROM rust:latest
RUN apt update  && apt install -y vim sudo git curl tmux exuberant-ctags openssh-client
RUN adduser --uid 1000 --disabled-password siuyin 
RUN echo 'siuyin   ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER siuyin
WORKDIR /home/siuyin
ADD .vimrc
CMD ["bash"]
