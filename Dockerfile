FROM totem/ubuntu:raring

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mongodb-10gen

RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /var/{lib,log}/mongodb

EXPOSE  :27017 28017

ENTRYPOINT ["/usr/bin/mongod"]

CMD ["--help"]
