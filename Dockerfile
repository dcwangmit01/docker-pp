FROM fedora:30

## Install basic tools.
RUN dnf install -y graphviz pandoc xz \
 && dnf clean all

## Install pp.
WORKDIR /usr/local/bin
RUN curl -Ls https://cdsoft.fr/pp/pp-linux-x86_64.txz | tar Jxvf -

## Install templates.

#### https://github.com/Wandmalfarbe/pandoc-latex-template
WORKDIR /root/.pandoc/templates
RUN curl -Ls  https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.2.2/Eisvogel-1.2.2.tar.gz \
    | tar zxvf - \
 && mv eisvogel.tex eisvogel.latex \
 && rm -rf examples ._* icon.*

## Run 'pp' by default.
ENTRYPOINT ["pp"]
