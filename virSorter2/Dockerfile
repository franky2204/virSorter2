FROM quay.io/biocontainers/virsorter:2.2.4--pyhdfd78af_1
LABEL maintainer="Jiarong Guo"
LABEL version="2.2.4"
RUN mamba install -y -c conda-forge wget
VOLUME [ "/app" ]
WORKDIR /
COPY virSorter2SL.sh .
ENTRYPOINT ["bash"]