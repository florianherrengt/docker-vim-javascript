FROM ubuntu:latest

ENV TERM=xterm-256color

RUN apt-get update
RUN apt-get -y install vim curl git build-essential cmake python-dev ruby
RUN gem install sass
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get -y install nodejs
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN npm install -g eslint babel-eslint eslint-plugin-react

RUN git clone https://github.com/ternjs/tern_for_vim /~/.vim/bundle/tern_for_vim
WORKDIR /~/.vim/bundle/tern_for_vim
RUN npm install
RUN git clone https://github.com/Valloric/YouCompleteMe /~/.vim/bundle/YouCompleteMe
WORKDIR /~/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive
RUN ./install.py --tern-completer
RUN git clone git://github.com/altercation/vim-colors-solarized.git /~/.vim/bundle/vim-colors-solarized
RUN git clone https://github.com/jelera/vim-javascript-syntax.git /~/.vim/bundle/vim-javascript-syntax
RUN git clone https://github.com/pangloss/vim-javascript /~/.vim/bundle/vim-javascript
RUN git clone https://github.com/nathanaelkane/vim-indent-guides /~/.vim/bundle/vim-indent-guides
RUN git clone https://github.com/Raimondi/delimitMate /~/.vim/bundle/delimitMate
RUN git clone https://github.com/scrooloose/syntastic /~/.vim/bundle/syntastic
RUN git clone https://github.com/scrooloose/nerdcommenter /~/.vim/bundle/nerdcommenter
RUN git clone https://github.com/mxw/vim-jsx /~/.vim/bundle/vim-jsx
RUN git clone https://github.com/ekalinin/Dockerfile.vim /~/.vim/bundle/Dockerfile
RUN git clone https://github.com/cakebaker/scss-syntax.vim /~/.vim/bundle/scss-syntax
RUN git clone https://github.com/hail2u/vim-css3-syntax /~/.vim/bundle/vim-css3-syntax
RUN git clone https://github.com/gcorne/vim-sass-lint /~/.vim/bundle/vim-sass-lint
RUN git clone https://github.com/lfilho/cosco.vim /~/.vim/bundle/cosco
RUN git clone https://github.com/terryma/vim-multiple-cursors /~/.vim/bundle/vim-multiple-cursors
RUN git clone https://github.com/easymotion/vim-easymotion /~/.vim/bundle/vim-easymotion
RUN git clone https://github.com/ctrlpvim/ctrlp.vim /~/.vim/bundle/ctrlp
COPY ./.vimrc /~

RUN mkdir /projects
WORKDIR /projects

ENTRYPOINT vim
