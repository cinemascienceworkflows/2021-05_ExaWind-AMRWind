#!/bin/bash

#BSUB -J <pantheon_workflow_jid> 
#BSUB -P <compute_allocation> 
#BSUB -W 0:03
#BSUB -nnodes 1

# submit the job
jsrun --np 4 --nrs 1 --cpu_per_rs 4 --latency_priority cpu-cpu <pantheon_run_dir>/amr_wind <pantheon_run_dir>/abl_godunov.i
