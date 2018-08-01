FROM ubuntu:trusty

RUN \
   apt-get -y update && \
   apt-get -y install ca-certificates curl unzip && \
   cd /tmp && \
   curl -OL https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip && \
   unzip protoc-3.5.1-linux-x86_64.zip -d protoc3 && \
   sudo mv protoc3/bin/* /usr/local/bin/ && \
   sudo mv protoc3/include/* /usr/local/include/ && \
   sudo chown root:staff /usr/local/bin/protoc && \
   sudo chmod 755 /usr/local/bin/protoc && \
   sudo chown -R root:staff /usr/local/include/google && \
   sudo chmod 755 /usr/local/include/google

#ENTRYPOINT ["/usr/local/bin/docker-compose"]
