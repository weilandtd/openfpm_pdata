#!/bin/bash

# check if the directory $1/MPI exist

if [ -d "$1/MPI" ]; then
  echo "MPI already installed"
  exit 0
fi
#rm -rf openmpi-2.1.1
#rm openmpi-2.1.1.tar.bz2
#wget http://ppmcore.mpi-cbg.de/upload/openmpi-2.1.1.tar.bz2
#tar -xvf openmpi-2.1.1.tar.bz2
#cd openmpi-2.1.1
rm -rf ompi
git clone https://github.com/open-mpi/ompi.git
cd ompi
git checkout v3.0.0

#
#                  --disable-mca-dso \
#                 --disable-sysv-shmem \
#                 --enable-cxx-exceptions \
#                 --with-threads=posix \
#                 --without-cs-fs \
#                 --with-mpi-param_check=always \
#                 --enable-contrib-no-build=vt,libompitrace \
#
#--enable-mca-no-build=paffinity,installdirs-windows,timer-windows,shmem-sysv
#
#

./configure --prefix=$1/MPI --enable-mpi-fortran=yes CC=$3 CXX=$4 F77=$4 FC=$5
make -j $2
make install

# Mark the installation
echo 2 > $1/MPI/version

