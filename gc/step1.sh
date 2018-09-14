#!/bin/sh
set -e

export X509_USER_PROXY=`pwd`/x509
voms-proxy-info
WORKDIR=`pwd`
source /cvmfs/cms.cern.ch/cmsset_default.sh

cd /data/jpata/tth/sw-946p1-centos7/CMSSW_9_4_6_patch1/
export SCRAM_ARCH=slc7_amd64_gcc630

ulimit -c 0
eval `scram runtime -sh`
echo `which root`

df -h

#this is not needed in singularity, the working directory is mounted in /srv
#cd $TMPDIR
cd $WORKDIR

#Check that storage is accessible
ls -al /mnt/hadoop/store/user/${GC_USERNAME}
if [ $? -ne 0 ]; then
    echo "hdfs is not mounted"
    exit 1
fi

env > out.txt

#Run the job
python eventloop.py $FILE_NAMES

#Output root file will be automatically copied
