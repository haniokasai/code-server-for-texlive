FROM codercom/code-server 

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt update && sudo apt install -y zip unzip texlive-lang-cjk xdvik-ja evince texlive-fonts-recommended texlive-fonts-extra

RUN sudo apt clean

RUN /usr/bin/code-server --install-extension MS-CEINTL.vscode-language-pack-ja

RUN /usr/bin/code-server --install-extension James-Yu.latex-workshop  --force

COPY resources/ /resources/

RUN sudo chmod 777 -R /resources/*

RUN sh /resources/fixlatexworkshop.sh