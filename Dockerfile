FROM scratch
ADD amzn2-container-raw-2.0.20180827-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/amzn2/srpm-bundle.tar.gz?versionId=0KdltZx3MM5vxoNe2pcOqdYDebiCRhU0" \
 && echo "b6a703acc414a896f65edaa797ac89c90febc63e01a09b7f962e8ab64ed7d090 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
