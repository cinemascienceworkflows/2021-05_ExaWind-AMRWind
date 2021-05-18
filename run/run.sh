#!/bin/bash

source ./pantheon/env.sh

RUN_CLEAN=true

if $RUN_CLEAN; then
    echo "----------------------------------------------------------------------"
    echo "PTN: cleaning results directory ..." 
    echo "----------------------------------------------------------------------"

    rm -rf $PANTHEON_RUN_DIR
    mkdir $PANTHEON_RUN_DIR
fi

# set up spack env
. ${PANTHEON_RUN_DIR}/../spack/share/spack/setup-env.sh

# NaluWind executable variables
AMRWIND_BIN_DIR=$(spack location -i amr-wind)/bin

# copy executable and support files
cp ${AMRWIND_BIN_DIR}/amr_wind $PANTHEON_RUN_DIR
cp inputs/amr-wind/abl_godunov.i $PANTHEON_RUN_DIR
cp inputs/ascent/ascent_actions.yaml $PANTHEON_RUN_DIR
cp run/submit.sh $PANTHEON_RUN_DIR

# END: EDIT THIS SECTION
# --------------------------------------------------------------------

# go to run dir and update the submit script
pushd $PANTHEON_RUN_DIR &> /dev/null
sed -i "s/<pantheon_workflow_jid>/${PANTHEON_WORKFLOW_JID}/" submit.sh
sed -i "s#<pantheon_workflow_dir>#${PANTHEON_WORKFLOW_DIR}#" submit.sh
sed -i "s#<pantheon_run_dir>#${PANTHEON_RUN_DIR}#g" submit.sh
sed -i "s#<compute_allocation>#${COMPUTE_ALLOCATION}#" submit.sh

# submit the job
echo "----------------------------------------------------------------------"
echo "PTN: submitting run ..." 
echo "----------------------------------------------------------------------"
bsub submit.sh
