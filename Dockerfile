FROM scratch
ADD amzn-container-minimal-2018.03.0.20180827-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle.tar.gz?versionId=G7JV6l3amfK7ZI6vMX7naHgMkmf_uoNE" \
 && echo "ce4c3194cd8ed0137f80249be6e1cadd964102965926360d9bc8a58aef84e180 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
