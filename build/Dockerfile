FROM ubuntu:15.04

RUN apt-get update && apt-get install -y emacs24
RUN apt-get install -y wget
RUN apt-get install -y vim
ADD root /root

RUN emacs --batch --script /root/.emacs.d/init.el --kill
RUN mkdir -p /usr/src/slides
WORKDIR /usr/src/slides

ENTRYPOINT ["emacs", "index.org", "--kill", "--eval", "(progn (package-initialize) (require 'ox-ioslide) )", "-f", "org-ioslide-export-to-html"]
