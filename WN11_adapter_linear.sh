export EXP_NAME=WN11_base_adapter_linear_zero_init_epoch30_bs16_8_lr_1_5e_4
export DATA_NAME=WN11_data
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
export EXP_ROOT=exp_root
export MODEL_CACHE_DIR=cache

python run_triplet_classification.py \
--do_train \
--do_predict \
--data_dir ./data/WN11 \
--per_device_train_batch_size 16 \
--per_device_eval_batch_size 16 \
--data_cache_dir ${EXP_ROOT}/cache_${DATA_NAME} \
--model_cache_dir ${MODEL_CACHE_DIR} \
--model_name_or_path bert-base-cased \
--model_type template \
--use_NSP \
--use_mlpencoder \
--word_embedding_type \
--begin_temp 10 \
--mid_temp 10 \
--end_temp 10 \
--num_neg 1 \
--dropout 0.1 \
--layernorm \
--adapter_type linear \
--adapter_size 256 \
--only_corrupt_entity \
--margin 7 \
--max_seq_length 192 \
--learning_rate 1.5e-4 \
--adam_epsilon 1e-6 \
--num_train_epochs 30 \
--output_dir ${EXP_ROOT}/out_${EXP_NAME} \
--gradient_accumulation_steps 1 \
--save_steps 5280 \
--warmup_steps 5280 \
--weight_decay 0.01 \
--text_loss_weight 0.0 \
--test_ratio 1.
