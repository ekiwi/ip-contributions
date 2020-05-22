#!/usr/bin/env bash
# https://github.com/verilator/verilator

VERILATOR_VERSION=4.034

# clean
rm -rf verilator/

# install ubuntu packets
if [ `lsb_release -si` == "Ubuntu" ]; then
  sudo apt-get install git make autoconf g++ flex bison
fi

# directory to hold source and final installation
mkdir -p verilator
cd verilator/

# create a verilator root directory which will hold the final sources
mkdir root/
cd root/
INSTALL_PATH=`pwd`
echo $INSTALL_PATH
cd ..

# download the sources
wget https://github.com/verilator/verilator/archive/v$VERILATOR_VERSION.zip
unzip v$VERILATOR_VERSION.zip
cd verilator-$VERILATOR_VERSION

# compile
autoconf
./configure --prefix $INSTALL_PATH
make -j`nproc`
make install

