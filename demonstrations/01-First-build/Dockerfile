FROM ubuntu:14.04
RUN apt-get update && apt-get install -y wget
ENTRYPOINT ["wget", "-O-", "-q"]
CMD ["ifconfig.info"]
