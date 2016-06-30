#!/bin/bash
# @ job_name = rebuild_nemo
# @ output =rebuild_nemo.out
# @ error = rebuild_nemo.err
# @ shell = /usr/bin/env bash
# @ account_no = DEPSM16301
# @ class = General
# @ job_type = parallel
# @ notification = never
# @ node_usage = not_shared
# @ wall_clock_limit = 04:00:00
# @ task_affinity    = cpu(8)
# @ node = 1
# @ total_tasks=1
# @ parallel_threads=8
# @ queue

ulimit
export OMP_NUM_THREADS=8
MPI_DSM_VERBOSE=1; export MPI_DSM_VERBOSE

export DATADIR=/gpfs_hpcf/filesets/hpcf/working/behrense/SDIR_eORCA025/u-ad073

export NP=480
export TFILE=`ls -1 *_T_0000.nc`
export UFILE=`ls -1 *_U_0000.nc`
export VFILE=`ls -1 *_V_0000.nc`


#combine T
/home/behrense/bin/rebuild_nemo_AIX -t 8  `basename $TFILE _0000.nc` $NP  

#combine U
/home/behrense/bin/rebuild_nemo_AIX -t 8  `basename $UFILE _0000.nc` $NP

#combine V
/home/behrense/bin/rebuild_nemo_AIX -t 8  `basename $VFILE _0000.nc` $NP

#combine W


#mv files to STOREAGE

mv *T.nc $DATADIR
mv *U.nc $DATADIR
mv *V.nc $DATADIR
cp *.1m.????-??.nc $DATADIR


