FROM ubuntu:latest

ENV TERM=xterm-256color

RUN apt-get update
RUN apt-get -y install vim curl git build-essential cmake python-dev ruby
RUN gem install sass
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get -y install nodejs
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN npm install -g eslint babel-eslint eslint-plugin-react

RUN git clone https://github.com/ternjs/tern_for_vim /root/.vim/bundle/tern_for_vim
WORKDIR /root/.vim/bundle/tern_for_vim
RUN npm install
RUN git clone https://github.com/Valloric/YouCompleteMe /root/.vim/bundle/YouCompleteMe
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive
RUN ./install.py --tern-completer
RUN git clone git://github.com/altercation/vim-colors-solarized.git /root/.vim/bundle/vim-colors-solarized
RUN git clone https://github.com/jelera/vim-javascript-syntax.git /root/.vim/bundle/vim-javascript-syntax
RUN git clone https://github.com/pangloss/vim-javascript /root/.vim/bundle/vim-javascript
RUN git clone https://github.com/nathanaelkane/vim-indent-guides /root/.vim/bundle/vim-indent-guides
RUN git clone https://github.com/Raimondi/delimitMate /root/.vim/bundle/delimitMate
RUN git clone https://github.com/scrooloose/syntastic /root/.vim/bundle/syntastic
RUN git clone https://github.com/scrooloose/nerdcommenter /root/.vim/bundle/nerdcommenter
RUN git clone https://github.com/mxw/vim-jsx /root/.vim/bundle/vim-jsx
RUN git clone https://github.com/ekalinin/Dockerfile.vim /root/.vim/bundle/Dockerfile
RUN git clone https://github.com/cakebaker/scss-syntax.vim /root/.vim/bundle/scss-syntax
RUN git clone https://github.com/hail2u/vim-css3-syntax /root/.vim/bundle/vim-css3-syntax
RUN git clone https://github.com/gcorne/vim-sass-lint /root/.vim/bundle/vim-sass-lint
RUN git clone https://github.com/lfilho/cosco.vim /root/.vim/bundle/cosco
COPY ./.vimrc /root
COPY ./.aliases /root

RUN mkdir /projects
WORKDIR /projects

ENTRYPOINT vim
