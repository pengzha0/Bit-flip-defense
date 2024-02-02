dataset=cifar10
data_path=/home/cmax/users/zp/data/cifar10
model=resnet20_quan 
optimizer=Adam
learning_rate=0.001
epochs=100
test_batch_size=128
workers=8
ngpu=1
print_freq=50
manualSeed=5678
n_iter=50
k_top=80
attack_sample_size=128

start=2
end=20
file_path="/home/cmax/users/zp/Bit-flip-defense/save/0006"
for ((i=start; i<=end; i+=2)) 
do
  # new_file_path="${file_path/6/$((i/2+7))}"
  python train.py --dataset ${dataset} \
      --data_path ${data_path}   \
      --arch ${model} --optimizer ${optimizer} --learning_rate ${learning_rate}\
      --epochs ${epochs} --gpu_id $((i/2-1))\
      --save_path ${file_path/6/$((i/2+7))}  \
      --test_batch_size ${test_batch_size} --workers 8 --ngpu ${ngpu} \
      --print_freq 50 --manualSeed ${manualSeed}\
      --n_iter ${n_iter} --k_top ${k_top} \
      --attack_sample_size ${attack_sample_size} --lambd 0.01 --attack_num ${i}&
done


