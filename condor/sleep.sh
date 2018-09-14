#!/bin/sh
set -e

WORKDIR=`pwd`

whoami
echo "pwd", `pwd`
echo "Hostname", `hostname`
date
env

voms-proxy-info

source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc7_amd64_gcc630
ulimit -c 0
cd /cvmfs/cms.cern.ch/slc7_amd64_gcc630/cms/cmssw/CMSSW_10_2_0
eval `scram runtime -sh`
echo `which root`

cd $WORKDIR

#All done
sleep $1
echo "I slept for $1 seconds, all was successful"
