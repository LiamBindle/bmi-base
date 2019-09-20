#!/bin/bash
set -x
set -e

yum update -y
yum install -y gcc-c++ gcc-gfortran 
yum install -y centos-release-scl
yum install -y devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-gcc-gfortran
yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-gcc-gfortran
