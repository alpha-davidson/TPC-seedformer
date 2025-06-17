#!/bin/bash
#SBATCH --gpus=1 --constraint=cuda10
source /opt/conda/bin/activate seedformer
module load CUDA/10.2.89

cd ./codes/pointnet2_ops_lib
python setup.py install

cd ../Chamfer3D
python setup.py install
