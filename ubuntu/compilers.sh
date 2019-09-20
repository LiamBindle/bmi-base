#!/bin/bash
set -x
set -e

cat /etc/os-release

apt-get update
apt-get install -yq software-properties-common
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

prio=0
for GCC_VERSION in 4.9 5 6 7 8 9
do
    apt-get install -yq gcc-${GCC_VERSION} g++-${GCC_VERSION} gfortran-${GCC_VERSION}
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${GCC_VERSION} $prio
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${GCC_VERSION} $prio
    update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-${GCC_VERSION} $prio
    (( prio = $prio + 10))
done

update-alternatives --install /usr/bin/cc   cc  /usr/bin/gcc        10
update-alternatives --install /usr/bin/c++  c++ /usr/bin/g++        10
update-alternatives --install /usr/bin/f95  f95 /usr/bin/gfortran   10
update-alternatives --install /usr/bin/f77  f77 /usr/bin/gfortran   10
update-alternatives --set cc  /usr/bin/gcc
update-alternatives --set c++ /usr/bin/g++
update-alternatives --set f95 /usr/bin/gfortran
update-alternatives --set f77 /usr/bin/gfortran