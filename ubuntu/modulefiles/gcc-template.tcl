#%Module1.0
## gcc modulefile
##
proc ModulesHelp { } {
    global version

    puts stderr "\tSets up environment for GCC GCC_VERSION"
}

conflict gcc

module-whatis "sets up environment for GCC GCC_VERSION" 

set version GCC_VERSION
set CC gcc 
set CXX g++ 
set FC gfortran

if { [module-info mode load] } {
    exec update-alternatives --set gcc /usr/bin/gcc-GCC_VERSION
    exec update-alternatives --set g++ /usr/bin/g++-GCC_VERSION
    exec update-alternatives --set gfortran /usr/bin/gfortran-GCC_VERSION
}
if { [module-info mode remove] } {
        exec update-alternatives --auto gcc
        exec update-alternatives --auto g++
        exec update-alternatives --auto gfortran
}
