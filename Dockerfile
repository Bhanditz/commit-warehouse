FROM scratch
ADD amzn2-container-raw-2.0.20181010-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/amzn2/srpm-bundle.tar.gz?versionId=_uFmafMKERILPq3MZ7xKNOyUR6wN_m9d" \
 && echo "8adebd309defad308f0d3216a73fdf90171657df951abc07630e6f4083d6d718 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
