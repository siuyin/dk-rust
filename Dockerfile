FROM rust:latest
RUN apt update  && apt install -y vim sudo git curl tmux exuberant-ctags openssh-client
RUN adduser --uid 1000 --disabled-password siuyin 
RUN echo 'siuyin   ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER siuyin
WORKDIR /home/siuyin
RUN mkdir -p .vim/autoload
ADD --chown=siuyin:siuyin .vimrc .
ADD --chown=siuyin:siuyin  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim .vim/autoload
CMD ["bash"]
