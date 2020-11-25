FROM alpine:3.11
ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION $ANSIBLE_VERSION

RUN apk --update add python3 openssl ca-certificates jq
RUN apk --update add --virtual build-dependencies \
  python3-dev libffi-dev openssl-dev build-base
RUN pip3 install --upgrade pip cffi

RUN echo "Build for ANSIBLE_VERSION: ${ANSIBLE_VERSION}" \
  && pip3 install ansible==${ANSIBLE_VERSION} boto3==1.16.25
RUN ansible-galaxy collection install amazon.aws ansible.posix

ENTRYPOINT ["/bin/sh", "-c"]
