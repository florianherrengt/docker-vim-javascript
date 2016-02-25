FROM ubuntu:latest

ENV TERM=xterm-256color

RUN apt-get update
RUN apt-get -y install vim curl git build-essential cmake python-dev ruby
RUN gem install sass
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get -y install nodejs
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN npm install -g eslint@1.9 babel-eslint eslint-plugin-react

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
RUN git clone https://github.com/terryma/vim-multiple-cursors /root/.vim/bundle/vim-multiple-cursors
RUN git clone https://github.com/easymotion/vim-easymotion /root/.vim/bundle/vim-easymotion
RUN git clone https://github.com/fholgado/minibufexpl.vim /root/.vim/bundle/minibufexpl
RUN git clone https://github.com/scrooloose/nerdtree /root/.vim/bundle/nerdtree
RUN git clone https://github.com/Xuyuanp/nerdtree-git-plugin /root/.vim/bundle/nerdtree-git-plugin
RUN git clone https://github.com/wincent/command-t  /root/.vim/bundle/command-t
RUN git clone https://github.com/tpope/vim-vinegar  /root/.vim/bundle/vim-vinegar
RUN git clone https://github.com/ctrlpvim/ctrlp.vim  /root/.vim/bundle/ctrlp
RUN git clone https://github.com/vim-airline/vim-airline  /root/.vim/bundle/vim-airline
RUN git clone https://github.com/mhinz/vim-signify  /root/.vim/bundle/vim-signify
RUN git clone https://github.com/mattn/emmet-vim  /root/.vim/bundle/emmet-vim

COPY ./.vimrc /root

RUN mkdir /projects
WORKDIR /projects

ENTRYPOINT vim
