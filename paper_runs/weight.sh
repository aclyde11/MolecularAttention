python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/train_weight.npy \
  --lr 8e-5 -w 1 -i moses/train.smi -o saved_models/moses_weight.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/train_images.npy --width 128 --depth 3 -r 0

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_weight.npy \
  --lr 8e-5 -w 1 -i moses/test.smi -o saved_models/moses_weight.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_images.npy --width 128 --depth 3 -r 0 --eval_train  > moses_weight_performance.txt

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_scaffold_weight.npy \
  --lr 8e-5 -w 1 -i moses/test_scaffold.smi -o saved_models/moses_weight.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_scaffold_images.npy --width 128 --depth 3 -r 0 --eval_train  >> moses_weight_performance.txt


python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/train_weight.npy \
  --lr 8e-5 -w 1 -i moses/train.smi -o saved_models/moses_weight_bw.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/train_images.npy --width 128 --depth 3 -r 0 --bw

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_weight.npy \
  --lr 8e-5 -w 1 -i moses/test.smi -o saved_models/moses_weight_bw.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_images.npy --width 128 --depth 3 -r 0 --eval_train  --bw >> moses_weight_performance.txt

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_scaffold_weight.npy \
  --lr 8e-5 -w 1 -i moses/test_scaffold.smi -o saved_models/moses_weight_bw.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_scaffold_images.npy --width 128 --depth 3 -r 0 --eval_train  --bw >> moses_weight_performance.txt


python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/train_weight.npy \
  --lr 8e-5 -w 1 -i moses/train.smi -o saved_models/moses_weight_nopt.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/train_images.npy --width 128 --depth 3 -r 0 --no_pretrain

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_weight.npy \
  --lr 8e-5 -w 1 -i moses/test.smi -o saved_models/moses_weight_nopt.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_images.npy --width 128 --depth 3 -r 0 --eval_train  --no_pretrain >> moses_weight_performance.txt

python train.py -pb --rotate --mae -t 1 -p weight -b 512 --epochs 25 --precomputed_values moses/test_scaffold_weight.npy \
  --lr 8e-5 -w 1 -i moses/test_scaffold.smi -o saved_models/moses_weight_nopt.pt --nheads 8 --dropout_rate 0.2 --amp O2 \
  --precomputed_images moses/test_scaffold_images.npy --width 128 --depth 3 -r 0 --eval_train  --no_pretrain >> moses_weight_performance.txt