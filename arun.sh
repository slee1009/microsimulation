#!/bin/bash

# TODO parameterise start/end years? 

# ensure appropriate conda env has been activated

if [ -z "$NOMIS_API_KEY" ]; then
  echo NOMIS_API_KEY is not set, exiting
  exit 1
fi

if [ -z "$REGION" ]; then
  echo REGION is not set, exiting
  exit 1
fi

#$ -m e
#$ -M a.p.smith@leeds.ac.uk
#$ -cwd -V
#$ -l h_vmem=1G
#$ -pe smp 1 
##$ -l node_type=256thread-112G 
python3 scripts/run_assignment.py -c config/ass_default.json $REGION
