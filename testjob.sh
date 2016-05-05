#! /bin/sh

#@ job_name = testjob
#@ account_no = hpcf
#@ class = General
#@ job_type = parallel
#@ node = 1
#@ tasks_per_node = 1
#@ rset = RSET_MCM_AFFINITY
#@ network.MPI      = sn_all,,IP
#@ wall_clock_limit = 00:01:00
#@ queue

##mpirun -np 1 sleep 1
sleep 10
