# Use a base image optimized for Intel CPUs and supporting GPU acceleration with PyTorch
FROM intel/intel-optimized-pytorch:latest

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY run_model.py .

# Install any additional dependencies required by your Python script
RUN pip install transformers dill accelerate

# Define environment variables for seed prompt and input text
ENV SEED_PROMPT="default_seed_prompt"
ENV INPUT_TEXT="default_input_text"
# Run initialization code to create the pipe object, serialize it, and store it as an environmental variable
RUN python -c "from transformers import pipeline; import torch; import dill; import os; pipe = pipeline('text-generation', model='HuggingFaceH4/zephyr-7b-beta', torch_dtype=torch.bfloat16, device_map='auto'); os.environ['PIPELINE'] = dill.dumps(pipe).hex()"


# Define the command to run your Python script when the container starts
CMD ["python", "run_model.py", "--seed-prompt", "${SEED_PROMPT}", "--input-text", "${INPUT_TEXT}"]
