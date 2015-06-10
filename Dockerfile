FROM alpine:3.2

MAINTAINER Christian Blades <christian.blades@careerbuilder.com>

ENV RELEASE=v2.0.11

ADD https://github.com/coreos/etcd/releases/download/${RELEASE}/etcd-${RELEASE}-linux-amd64.tar.gz /tmp/etcd.tgz

RUN apk -U add ca-certificates && cd /tmp && tar xzf etcd.tgz && mv etcd-${RELEASE}-linux-amd64/etcdctl /bin && rm -r /tmp/* /var/cache/apk/*

ENTRYPOINT ["/bin/etcdctl"]
