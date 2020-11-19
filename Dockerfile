FROM alpine:3.11

RUN apk --update add python3 openssl ca-certificates
RUN apk --update add --virtual build-dependencies \
  python3-dev libffi-dev openssl-dev build-base
RUN pip3 install --upgrade pip cffi
RUN pip3 install ansible==2.10.3

RUN ansible-galaxy collection install amazon.aws ansible.posix

ENTRYPOINT ["/bin/sh", "-c"]
