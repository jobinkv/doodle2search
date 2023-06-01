#!/bin/bash
#SBATCH -A jobinkv
#SBATCH -c 4
#       #SBATCH --reservation non-deadline-queue
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=4GB
#SBATCH --time=4-00:00:00


# sketch based image retrieval

path_dataset=/ssd_scratch/cvit/jobinkv

mkdir -p $path_dataset

cd


unzip -n  QuickDraw_images_final.zip -d $path_dataset/
unzip -n  QuickDraw_sketches_final.zip -d $path_dataset/
cd $path_dataset/QuickDraw_images_final
# ls | tee ../quick_label.txt
cp /home/jobinkv/doodle2search/quick_label.txt $path_dataset/

cd /home/jobinkv/doodle2search/src/

/home/jobinkv/miniconda3/envs/sktch/bin/python train.py quickdraw_extend 

# mv $path_dataset/QuickDraw_images_final/'wine bottle' $path_dataset/QuickDraw_images_final/wine_bottle
# mv $path_dataset/QuickDraw_images_final/'soccer ball' $path_dataset/QuickDraw_images_final/soccer_ball
# mv $path_dataset/QuickDraw_images_final/'palm tree' $path_dataset/QuickDraw_images_final/palm_tree
# mv $path_dataset/QuickDraw_images_final/'eiffel tower' $path_dataset/QuickDraw_images_final/eiffel_tower
# mv $path_dataset/QuickDraw_images_final/'cruise ship' $path_dataset/QuickDraw_images_final/cruise_ship

# mv $path_dataset/QuickDraw_sketches_final/'wine bottle' $path_dataset/QuickDraw_sketches_final/wine_bottle
# mv $path_dataset/QuickDraw_sketches_final/'soccer ball' $path_dataset/QuickDraw_sketches_final/soccer_ball
# mv $path_dataset/QuickDraw_sketches_final/'palm tree' $path_dataset/QuickDraw_sketches_final/palm_tree
# mv $path_dataset/QuickDraw_sketches_final/'eiffel tower' $path_dataset/QuickDraw_sketches_final/eiffel_tower
# mv $path_dataset/QuickDraw_sketches_final/'cruise ship' $path_dataset/QuickDraw_sketches_final/cruise_ship

# unzip -n rendered_256x256.zip -d $path_dataset/
# mv $path_dataset/rendered_256x256/256x256 $path_dataset/Sketchy
# mv $path_dataset/256x256 $path_dataset/Sketchy

# cd /home/jobinkv/doodle2search
# # /home/jobinkv/miniconda3/envs/mlp_env/bin/python src/download_gdrive.py 0B2U-hnwRkpRrdGZKTzkwbkEwVkk $path_dataset/Sketchy/extended_photo.zip
# # unzip -qq $path_dataset/Sketchy/extended_photo.zip -d $path_dataset/Sketchy

# rm -r $path_dataset/Sketchy/sketch/tx_000000000010
# rm -r $path_dataset/Sketchy/sketch/tx_000000000110
# rm -r $path_dataset/Sketchy/sketch/tx_000000001010
# rm -r $path_dataset/Sketchy/sketch/tx_000000001110
# rm -r $path_dataset/Sketchy/sketch/tx_000100000000
# rm -r $path_dataset/Sketchy/photo/tx_000100000000

# mv $path_dataset/Sketchy/sketch/tx_000000000000/hot-air_balloon $path_dataset/Sketchy/sketch/tx_000000000000/hot_air_balloon
# mv $path_dataset/Sketchy/sketch/tx_000000000000/jack-o-lantern $path_dataset/Sketchy/sketch/tx_000000000000/jack_o_lantern
# mv $path_dataset/Sketchy/photo/tx_000000000000/hot-air_balloon $path_dataset/Sketchy/photo/tx_000000000000/hot_air_balloon
# mv $path_dataset/Sketchy/photo/tx_000000000000/jack-o-lantern $path_dataset/Sketchy/photo/tx_000000000000/jack_o_lantern

# cd $path_dataset
#wget http://datasets.cvc.uab.es/QuickDraw/QuickDraw_sketches_final.zip 
#wget http://datasets.cvc.uab.es/QuickDraw/QuickDraw_images_final.zip

#unzip -n QuickDraw_sketches_final.zip
#unzip -n QuickDraw_images_final.zip

# cd /home/jobinkv/doodle2search/src/

# /home/jobinkv/miniconda3/envs/sktch/bin/python train.py quickdraw_extend --data_path <mention the data path of the dataset