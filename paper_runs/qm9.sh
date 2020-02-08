python train.py -pb --rotate --mae -t 18 -b 128 --epochs 50 --precomputed_values qm9/qm9_values.npy \
  --lr 1e-4 -w 1 -i qm9/qm9.smi -o saved_models/qm9.pt --nheads 0 --dropout_rate 0.1 --amp O1 \
  --precomputed_images qm9/qm9_images.npy --width 256  --depth 4 --cv 4 -r 0 -p custom --no_pretrain --eval_test --output_preds qm9/qm9_eval.npy
