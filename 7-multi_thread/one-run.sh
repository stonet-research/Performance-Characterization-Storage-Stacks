#!/bin/bash
set -ex 

if [ $# -eq 1 ]; then 
	CONF=$1
else 
	CONF=iou_s.conf
fi 

#restrict in on the domain 1 
numactl -C 10-19 -m 1 env FIO_RUN_TIME=10 FIO_RAMP_TIME=5 /home/atr/local/bin/fio $CONF --thread=1 --numjobs=1 
