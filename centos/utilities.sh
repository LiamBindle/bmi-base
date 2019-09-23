set -x
set -e

yum install -y bzip2 zip wget curl autoconf automake flex bison make python git vim which environment-modules patch

mkdir /modulefiles
mkdir /modulefiles/gcc
cd /modulefiles
/usr/share/Modules/bin/createmodule.sh /opt/rh/devtoolset-7/enable > gcc/7
/usr/share/Modules/bin/createmodule.sh /opt/rh/devtoolset-8/enable > gcc/8
export MODULEPATH=$MODULEPATH:/modulefiles

cd /
git clone https://github.com/spack/spack.git
cd spack
git checkout v0.12.1
. share/spack/setup-env.sh
spack bootstrap
spack install gcc@5 gcc@6 gcc@9