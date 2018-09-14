You can use grid-control to manage your condor batch jobs.

The file `2017B_SingleMuon.txt` lists all the input files, along with the
number of events per file. The number of events is optional and is needed
only in case you want to split jobs by events rather than files.

The control file `step1.conf` configures the jobs. Make sure you have set the
$X509_USER_PROXY environment variable to the location of your proxy file (`voms-proxy-info -path`).
The jobs are submitted using

~~~
/data/sw-local/grid-control/go.py step1.conf -q
~~~
and will run the script `step1.sh` on the worker nodes, which will call `eventloop.py` and produce an output file `out.root`.

In order to monitor the jobs, you can run
~~~
/opt/grid-control/go.py step1.conf -cqG
~~~
It's safe to kill this script at any time.

The output file will be copied directly to the `/mnt/hadoop` T2 storage.
