# Roary dockerfile
# VERSION latest

# Set the base image to Ubuntu
FROM ubuntu:14.04

MAINTAINER cheng gong <512543469@qq.com>

# Update the repository sources list
RUN apt-get update

# Install compiler
RUN apt-get install -y \
 build-essential \
 gcc-multilib \
 apt-utils \
 expat \
 libexpat-dev 

# Install perl 
RUN apt-get install -y perl

# Install perl modules 
RUN apt-get install -y cpanminus perl-doc

RUN cpanm --mirror http://mirrors.163.com/cpan --mirror-only \
 Pod::Perldoc::ToMan \
 CPAN::Meta \
 readline \
 YAML \
 Digest::SHA \
 Module::Build \
 ExtUtils::MakeMaker \
 Test::More \
 Data::Stag \
 Config::Simple \
 Statistics::Lite \
 Statistics::Descriptive 

RUN apt-get install -y \
 libarchive-zip-perl

# Install BioPerl dependancies
RUN apt-get install -y \
 libpixman-1-0 \
 libpixman-1-dev \
 graphviz \
 libxml-parser-perl \
 libsoap-lite-perl 

RUN apt-get install -y \
 libxml-libxml-perl \
 libxml-dom-xpath-perl \
 libxml-libxml-simple-perl \
 libxml-dom-perl

# Install BioPerl
RUN cpanm --mirror http://mirrors.163.com/cpan --mirror-only \
 CJFIELDS/BioPerl-1.6.924.tar.gz

# Install Roary and dependencies
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

CMD ["/bin/bash"]
