# Roary dockerfile
# VERSION latest

FROM ubuntu1404:bio_perl
MAINTAINER cheng gong <1461744165@qq.com>

# Update the repository sources list
RUN apt-get update

RUN apt-get install -y \
    bedtools \ 
    cd-hit \ 
    ncbi-blast+ \ 
    mcl \ 
    parallel \ 
    prank \ 
    mafft \ 
    fasttree

RUN cpanm -f Bio::Roary

VOLUME ["/input", "/output", "/databases", "/share"]
WORKDIR /

ENTRYPOINT ["/bin/bash"]
