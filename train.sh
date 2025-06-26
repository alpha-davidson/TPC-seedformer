#!/bin/bash
### Job Parameters:
# basic info
#SBATCH --job-name "train-seedformer"                # name
#SBATCH --output "Train.out"      # output file
#SBATCH --error  "Train.err"      # error message file

# resource request info 
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --exclude=alpha3

# Opt-into email alerts
#SBATCH --mail-type ALL
#SBATCH --mail-user cihallinan@davidson.edu

## Script to Execute:
# change working directory to pipenv managed directory

cd codes
source /opt/conda/bin/activate seedformer
# execute python script in virtal env.
python train_pcn.py
