FROM ubuntu:15.04

RUN apt-get update && apt-get install -y emacs24
RUN apt-get install -y wget
RUN apt-get install -y vim
ADD root /root

RUN emacs --batch --script /root/.emacs.d/init.el --kill

ENTRYPOINT ["emacs", "--batch", "-f", "org-html-export-to-html", "--kill"]
