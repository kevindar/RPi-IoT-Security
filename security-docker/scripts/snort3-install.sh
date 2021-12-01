#!/bin/bash
 apt-get update
mkdir ~/snort_src; cd ~/snort_src
 apt-get install -y build-essential autotools-dev libdumbnet-dev \
libluajit-5.1-dev libpcap-dev zlib1g-dev pkg-config libhwloc-dev \
cmake

# install snort3 dependencies
 apt-get install -y liblzma-dev openssl libssl-dev cpputest \
libsqlite3-dev uuid-dev
 apt-get install -y asciidoc dblatex source-highlight w3m
 apt-get install -y libtool git autoconf
 apt-get install -y bison flex
wget https://github.com/rurban/safeclib/releases/download/v02092020/libsafec-02092020.tar.gz
tar -xzvf libsafec-02092020.tar.gz
cd libsafec-02092020.0-g6d921f/
./configure
make
 make install

# install Hyperscan dependencies
## Perl Compatible Regular Expressions
cd ~/snort_src
wget https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.gz
tar -xzvf pcre-8.45.tar.gz
cd pcre-8.45
./configure
make
 make install
## gperf tools 2.9
cd ~/snort_src
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
tar xzvf gperftools-2.9.1.tar.gz
cd gperftools-2.9.1
./configure
make
 make install
## Ragel
cd ~/snort_src
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
tar -xzvf ragel-6.10.tar.gz
cd ragel-6.10
./configure
make
 make install
## Boost C++ library (just download no install)
cd ~/snort_src
wget https://dl.bintray.com/boostorg/release/1.76.0/source/boost_1_76_0.tar.gz
tar -xvzf boost_1_76_0.tar.gz
# Install Hyperscan 5.4 from source
cd ~/snort_src
wget https://github.com/intel/hyperscan/archive/v5.4.0.tar.gz
tar -xvzf v5.4.0.tar.gz
mkdir ~/snort_src/hyperscan-5.4.0-build
cd hyperscan-5.4.0-build/
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=~/snort_src/boost_1_76_0/ ../hyperscan-5.4.0
make
 make install
# Install flatbuffers
cd ~/snort_src  
wget https://github.com/google/flatbuffers/archive/refs/tags/v2.0.0.tar.gz -O flatbuffers-v2.0.0.tar.gz  
tar -xzvf flatbuffers-v2.0.0.tar.gz  
mkdir flatbuffers-build  
cd flatbuffers-build 
cmake 
../flatbuffers-2.0.0
make
 make install

# Install Data Acquisition Library (DAQ)
cd ~/snort_src
git clone https://github.com/snort3/libdaq.git
cd libdaq
./bootstrap
./configure
make
 make install
 ldconfig


cd ~/snort_src
wget https://github.com/snort3/snort3/archive/refs/tags/3.1.6.0.tar.gz -O snort3
tar -xzvf snort3-3.1.6.0.tar.gz
cd snort3
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build
make
 make install
echo "Snort version displayed below\n"
/usr/local/bin/snort -V