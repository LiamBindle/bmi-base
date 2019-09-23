set -x
set -e

apt-get install -yq bzip2 zip wget curl autoconf automake flex bison make python git vim tcl tcl-dev patch libsigsegv-dev libtool texinfo findutils libpciaccess-dev numactl libxml2-dev pkgconf uuid-dev

MODULES_VERSION=4.3.0
wget http://downloads.sourceforge.net/project/modules/Modules/modules-${MODULES_VERSION}/modules-${MODULES_VERSION}.tar.gz
tar -xvf modules-${MODULES_VERSION}.tar.gz
cd modules-${MODULES_VERSION}
./configure --modulefilesdir=/modulefiles
make
make install
cd ..
rm -rf modules-*
ln -s /usr/local/Modules/init/profile.sh /etc/profile.d/modules.sh
source /usr/local/Modules/init/bash
echo "source /usr/local/Modules/init/bash" >> /etc/bash.bashrc

mkdir /modulefiles/gcc
for GCC_VERSION in 4.9 5 6 7 8 9
do
    sed "s/GCC_VERSION/$GCC_VERSION/" /modulefiles/gcc-template.tcl > /modulefiles/gcc/$GCC_VERSION
done
rm /modulefiles/gcc-template.tcl

cd /
git clone https://github.com/spack/spack.git
cd spack
git checkout v0.12.1
. share/spack/setup-env.sh
spack bootstrap
