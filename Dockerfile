FROM rust:latest
RUN apt update  && apt install -y vim sudo git curl tmux exuberant-ctags openssh-client
RUN adduser --uid 1000 --disabled-password siuyin 
RUN echo 'siuyin   ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ADD https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.gz /tmp/nodejs.tar.gz
RUN tar -C /usr/local --strip-components=1 -xf /tmp/nodejs.tar.gz
USER siuyin
WORKDIR /home/siuyin
ADD --chown=siuyin:siuyin .vimrc .
ADD --chown=siuyin:siuyin  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim .vim/autoload/
CMD ["bash"]
