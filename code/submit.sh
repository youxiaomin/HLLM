set -x

item_pretrain_dir=/njfs/train-push/models/Baichuan2-7B-Base
user_pretrain_dir=None
text_path=../infomation/amazon_items

python3 main.py \
--config_file overall/LLM_deepspeed.yaml HLLM/HLLM.yaml \ # We use deepspeed for training by default.
--loss nce \
--epochs 5 \
--dataset {amazon_books} \
--train_batch_size 16 \
--MAX_TEXT_LENGTH 256 \
--MAX_ITEM_LIST_LENGTH 10 \
--checkpoint_dir saved_path \
--optim_args.learning_rate 1e-4 \
--item_pretrain_dir item_pretrain_dir \ # Set to LLM dir.
--user_pretrain_dir user_pretrain_dir \ # Set to LLM dir.
--text_path text_path \ # Use absolute path to text files.
--text_keys '[\"title\", \"description\"]' # Please remove tag in books dataset.