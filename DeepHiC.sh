#After installing DeepHiC which needs a separate environment with conda we should have some python scripts which have to run separately.
conda create --name hic python=3.9.12 pytorch torchvision numpy scipy pandas scikit-learn matplotlib tqdm -c pytorch
conda activate hic
conda install -c conda-forge visdom
#this also has to be run, not sure why!
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/miniconda3/lib
#first things first, there is a file called all_parser.py and root directory will be set in this file
#all files must be in same folder, for example model folder has to be in the folder that the prediction code is submitted
python hicpro2deephic.py
#mm10 or hg38 folders will be created and also a mat folder inside of them which inludes matrix files.

#2. 
python ~/DeepHiC/data_generate.py -hr 100000 -lr 100000 -lrc 10 -s mouse -chunk 2 -stride 100 -bound 205 -scale 1 -c path/to/mat/folder/in/step1/folder_100000



#3.
python ~/DeepHiC/data_predict.py -lr 100000 -ckpt /path/to/folder/that/comes/with/DeepHiC/save/deephic_raw_16.pth -c folder_100000/


