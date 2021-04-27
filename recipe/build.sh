#!/bin/bash

#export ARCH="x86_64"
#export FOX_LIB="-L${PREFIX}/lib -lFoX_dom -lFoX_sax -lFoX_wxml -lFoX_common -lFoX_utils -lFoX_fsys "
#export IFLAGS="-I${SRC_DIR}/include -I${PREFIX}/finclude -I${SRC_DIR}/S3DE/iotk/include/"
#export BLAS_LIBS="-L${PREFIX}/lib -lblas"
#export SCALAPACK_LIBS="-L${PREFIX}/lib -lscalapack"
#export LAPACK_LIBS="-L${PREFIX}/lib -llapack"
#export FFT_LIBS="-L${PREFIX}/lib -lfftw3"
#export MANUAL_DFLAGS="-D__FFTW3"
#
## Override C and Fortran preprocessor
#export CPP="${CC} -E -P"
#export FPP="${FC} -E -P -cpp"
##export CPPFLAGS="${CPPFLAGS}"
#
##export CC="${CC}"
#export CFLAGS="${CFLAGS} -fopenmp"
##export FC="${FC}"
#export FFLAGS="${FFLAGS} -fopenmp"
#export LD="mpif90"
#export LDFLAGS="${LDFLAGS} -fopenmp"
#
#./configure \
#    --prefix=${PREFIX} \
#    --enable-parallel \
#    --enable-openmp \
#    --with-scalapack

# download fox
rm -rf external/fox
#git clone https://github.com/pietrodelugas/fox/tree/819745f5849de5c9de516be133ab206691738257 external/fox
wget https://github.com/pietrodelugas/fox/archive/819745f5849de5c9de516be133ab206691738257.tar.gz
tar xf fox-819745f5849de5c9de516be133ab206691738257.tar.gz -c external/
mv external/fox-819745f5849de5c9de516be133ab206691738257 external/fox



mkdir build
cd build
cmake .. \
    -DQE_ENABLE_MPI=ON \
    -DQE_ENABLE_OPENMP=ON \
    -DQE_ENABLE_SCALAPACK=ON \
    -DQE_ENABLE_TEST=ON
    
make



#make pwall
#make ld1
#make cp
#make epw

## see https://gitlab.com/QEF/q-e/-/blob/develop/test-suite/Makefile
#cd test-suite
#make run-travis
#cd ..

make install
