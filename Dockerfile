FROM codercom/code-server 

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt update && sudo apt install -y zip unzip texlive-lang-cjk xdvik-ja evince texlive-fonts-recommended texlive-fonts-extra

RUN sudo apt clean

RUN /usr/bin/code-server --install-extension MS-CEINTL.vscode-language-pack-ja

RUN /usr/bin/code-server --install-extension James-Yu.latex-workshop  --force

COPY resources/* /tmp/

RUN sudo chmod +x /tmp/*

RUN curl -fsSL https://gist.githubusercontent.com/HannesGitH/bf70790accef0773821fd6b83b335292/raw/latex-workshop_code-server__quickfix.sh | sh 
