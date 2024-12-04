#!/bin/bash

# Define sample name, genome assembly, and resolution
SAMP="$1"
RGA="$2"
RES="$3" 

# Define the directory containing the sample folders
SAMPLE_DIR="./"


# Run hicpro2deephic.py for the current sample, this convert hic-pro output to .npz in order to be used in Python
python ~/DeepHiC/hicpro2deephic.py \
--bed "${SAMPLE_DIR}/${SAMP}/HiC_Pro_results/hic_results/matrix/${SAMP}/raw/${RES}/${SAMP}_${RES}_abs.bed" \
--mat "${SAMPLE_DIR}/${SAMP}/HiC_Pro_results/hic_results/matrix/${SAMP}/raw/${RES}/${SAMP}_${RES}.matrix" \
-r "${RES}" \
-o "${SAMPLE_DIR}/${SAMP}/DeepHiC/${RGA}/mat/${SAMP}_${RES}"

# Move to the output directory of the previous step
cd "${SAMPLE_DIR}/${SAMP}/DeepHiC/${RGA}"

# Run data_generate.py on the current sample, this will be saved in data folder which is temporary file and can be removed
python ~/DeepHiC/data_generate.py -hr "${RES}" -lr "${RES}" -lrc 100 -s human -chunk 40 -stride 40 -bound 9999 -scale 1 -c "${SAMP}_${RES}"

# Run data_predict.py on the current sample for predicted samples
python ~/DeepHiC/data_predict.py -lr "${RES}" -ckpt /cluster/projects/epigenomics/Jakob/HiC_tools/DeepHiC/save/deephic_raw_16.pth -c "${SAMP}_${RES}"
