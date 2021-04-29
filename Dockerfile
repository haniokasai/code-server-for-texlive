FROM codercom/code-server 

RUN apt update && texlive-lang-cjk xdvik-ja evince texlive-fonts-recommended texlive-fonts-extra

RUN apt cache clean

RUN code --install-extension MS-CEINTL.vscode-language-pack-ja

RUN code . --locale=ja

RUN code --install-extension James-Yu.latex-workshop

COPY resources/* /tmp/

RUN sh /tmp/fixlatexworkshop.sh