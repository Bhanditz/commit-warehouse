FROM scratch
ADD amzn2-container-raw-2.0.20190115-arm64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle-1ebf88f40e981f5f4912729108bed51e41acc1677187a0a5534ea27b7a2e049f.tar.gz" \
 && echo "1ebf88f40e981f5f4912729108bed51e41acc1677187a0a5534ea27b7a2e049f  /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
