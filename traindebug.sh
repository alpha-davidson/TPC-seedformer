#!/bin/bash

# ---------------------- Job Info ----------------------
#SBATCH --job-name="traindebug-seedformer"
#SBATCH --output="TrainDebug.out"
#SBATCH --error="TrainDebug.err"

# ------------------ Resource Request ------------------
#SBATCH --mem=32G                 # memory
#SBATCH --gres=gpu:1             # request 1 GPU
#SBATCH --exclude=alpha3         # exclude alpha3 (if buggy)

# ------------------- Notifications --------------------
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cihallinan@davidson.edu

# --------------------- Run Script ---------------------
echo ">>> Job started on $(hostname)"
echo ">>> Running on GPU node with CUDA visible devices:"
nvidia-smi || echo "nvidia-smi not found or GPU not available"

# Activate conda environment
cd codes
source /opt/conda/bin/activate seedformer

# Optional: Check CUDA availability before wasting time
python -c "import torch; assert torch.cuda.is_available(), 'CUDA not available'; print('✅ CUDA check passed!')"

# Start training
python train_pcn.py

echo ">>> Job completed."

