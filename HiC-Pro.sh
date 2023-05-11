#First the code below should be submitted, after that two separete .sh files will be generated which must be submitted one after another.

module load HiC-Pro/3.1.0 

cd ~/Aminnn/Hi-C

#fastq files could be be in a folder called Colon for example inside another folder called rawdata
/cluster/tools/software/centos7/hicpro/3.1.0/HiC-Pro_3.1.0/bin/HiC-Pro -i Path/to/fastqs/../rawdata/Colon/ -o path/to/output/HiC_res -c path/to/config-file/that/comes/with/hic-pro/config-hicpro.txt -p


#after running first command line, these two files will be generated and they could be submitted step by step
HiCPro_step1_hic-test_mm10.sh
HiCPro_step2_hic-test_mm10.sh

#step1 is alignment and results will be saved in a folder called bowtie2_results, step 2 is main analysis and will be saved in hic_results
