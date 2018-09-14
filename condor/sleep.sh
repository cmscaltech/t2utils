#!/bin/sh
set -e

#save the job landing directory and user
WORKDIR=`pwd`
USER=`whoami`

whoami
echo "pwd", `pwd`
echo "Hostname", `hostname`
date
env
df -h

source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc7_amd64_gcc630
ulimit -c 0
cd /cvmfs/cms.cern.ch/slc7_amd64_gcc630/cms/cmssw/CMSSW_10_2_0
eval `scram runtime -sh`
echo `which root`

#make sure we are in the proper working directory
cd $WORKDIR

#make sure we can access stuff from grid
xrdcp root://cms-xrd-global.cern.ch//store/data/Run2017B/SingleMuon/NANOAOD/31Mar2018-v1/10000/1254CE0A-CE44-E811-8886-0025905A6060.root ./out.root

#All done
sleep $1
echo "I slept for $1 seconds, all was successful"

cp out.root /mnt/hadoop/$USER/test.root
