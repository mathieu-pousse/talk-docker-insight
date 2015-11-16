FROM ubuntu:14.04
RUN apt-get update && apt-get install -y -qq wget
ENTRYPOINT ["wget", "-O-", "-q"]
CMD ["ifconfig.info"]
