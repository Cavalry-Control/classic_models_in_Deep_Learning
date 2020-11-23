#!/bin/bash

#文件下载：yum.tar.gz

InstallYum()
{
    echo "*********************************************************************"
    echo "************************start install yum****************************"

    tar -zxvf yum.tar.gz

    cd yum/rpm/

    rpm -ivh deltarpm-3.6-28.eulerosv2r8.aarch64.rpm dnf-data-4.0.4-1.h2.eulerosv2r8.noarch.rpm python3-iniparse-0.4-32.eulerosv2r8.noarch.rpm python3-libcomps-0.1.8-14.eulerosv2r8.aarch64.rpm libcomps-*.rpm
    rpm -ivh --force gpgme-1.11.1-3.eulerosv2r8.aarch64.rpm 
    rpm -ivh python3-gpg-1.11.1-3.eulerosv2r8.aarch64.rpm
    rpm -ivh libyaml-0.2.1-2.h1.eulerosv2r8.aarch64.rpm libmodulemd-1.6.4-1.eulerosv2r8.aarch64.rpm
    rpm -ivh python3-hawkey-0.22.0-6.eulerosv2r8.aarch64.rpm libdnf-0.22.0-6.eulerosv2r8.aarch64.rpm librepo-1.9.1-1.eulerosv2r8.aarch64.rpm libsolv-0.6.35-3.eulerosv2r8.aarch64.rpm python3-libdnf-0.22.0-6.eulerosv2r8.aarch64.rpm
    rpm -ivh ima-evm-utils-1.1-4.eulerosv2r8.aarch64.rpm
    rpm -ivh --force python3-rpm-4.14.2-1.h5.eulerosv2r8.aarch64.rpm rpm-libs-4.14.2-1.h5.eulerosv2r8.aarch64.rpm rpm-sign-*.rpm rpm-build-libs-4.14.2-1.h5.eulerosv2r8.aarch64.rpm rpm-4.14.2-1.h5.eulerosv2r8.aarch64.rpm
    rpm -ivh python3-dnf-*.rpm
    rpm -ivh dnf-4.0.4-1.h2.eulerosv2r8.noarch.rpm
    rpm -ivh yum-4.0.4-1.h2.eulerosv2r8.noarch.rpm
    rpm -ivh --force glib2-2.58.1-1.h1.eulerosv2r8.aarch64.rpm
    rpm -ivh --force libnghttp2-1.34.0-1.eulerosv2r8.aarch64.rpm
    rpm -ivh --force libssh-0.8.3-3.h1.eulerosv2r8.aarch64.rpm
    rpm -ivh --force brotli-1.0.5-1.eulerosv2r8.aarch64.rpm

    echo "**********************************************************************"
    echo "************************yum install finish****************************"
    cd ..
    echo "**********************************************************************"
    echo "**************************config the repo*****************************"
    mv /etc/yum.repos.d/euleros_aarch64.repo /etc/yum.repos.d/euleros_aarch64.repo.backup
    echo "******your yum euleros_aarch64.repo has been moved to /etc/yum.repos.d/euleros_aarch64.repo.backup*****"
    mv euleros_aarch64.repo /etc/yum.repos.d/euleros_aarch64.repo
    rpm --import RPM-GPG-KEY-EulerOS
    echo "**********************************************************************"
    echo "*************************check the new repolist***********************"
    yum repolist
}

InstallPacages()
{
    echo "**********************************************************************"
    echo "***************************yum install $1*****************************"
    yum -y install $1
}

main()
{
    echo "**********************************************************************"
    echo "********************************START*********************************"
    echo "**********************************************************************"
    InstallYum
    InstallPacages python3-devel
    InstallPacages openblas 
    InstallPacages blas 
    InstallPacages gcc-gfortran
    InstallPacages libarchive-devel
    InstallPacages cmake
    InstallPacages gcc-c++
    InstallPacages automake
    InstallPacages autoconf
    InstallPacages libtool
    InstallPacages make
    ln -s /usr/bin/ld.bfd /usr/bin/ld
    export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH
    echo "**********************************************************************"
    echo "*********************************END**********************************"
    echo "**********************************************************************"

}

main