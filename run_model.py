import argparse
import os
import dill
from transformers import pipeline

model_path = "/app/model/zephyr-7b-beta"  # Adjust the path as needed
pipe = pipeline('text-generation', model=model_path, tokenizer=model_path)

def parse_args():
    parser = argparse.ArgumentParser(description="Generate text using Hugging Face model.")
    parser.add_argument("--seed-prompt", type=str, help="Seed prompt for text generation", required=True)
    parser.add_argument("--input-text", type=str, help="Input text for generation", required=True)
    return parser.parse_args()

def get_model_output(seed_prompt: str, input_text: str) -> str:
    # Load the model directly from the files in the container
    
    messages = [
        {"role": "system", "content": seed_prompt},
        {"role": "user", "content": input_text},
    ]
    prompt = pipe.tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
    outputs = pipe(prompt, max_new_tokens=256, do_sample=True, temperature=0.7, top_k=50, top_p=0.95)
    return outputs[0]["generated_text"]

def main():
    args = parse_args()
    print(get_model_output(args.seed_prompt, args.input_text))

if __name__ == "__main__":
    main()