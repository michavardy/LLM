from transformers import pipeline
import torch
import dill
import os

def main():
    pipe = pipeline('text-generation', model='HuggingFaceH4/zephyr-7b-beta', torch_dtype=torch.bfloat16, device_map='auto')
    os.environ['PIPELINE'] = dill.dumps(pipe).hex()

if __name__ == "__main__":
    main()