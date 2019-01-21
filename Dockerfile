FROM scratch
ADD amzn-container-minimal-2018.03.0.20190118-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle-7c80178b5a15821ceaab518bce05b24ee51c41aeef9aaf1f7fd2c58082d79160.tar.gz" \
 && echo "7c80178b5a15821ceaab518bce05b24ee51c41aeef9aaf1f7fd2c58082d79160  /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
