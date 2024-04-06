# Use a base image optimized for Intel CPUs and supporting GPU acceleration with PyTorch
FROM intel/intel-optimized-pytorch:latest

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY run_model.py .

# Copy the model files into the container
COPY model/zephyr-7b-beta /app/model/zephyr-7b-beta

# Install any additional dependencies required by your Python script
RUN pip install transformers dill accelerate

# Define environment variables for seed prompt and input text
ENV SEED_PROMPT="default_seed_prompt"
ENV INPUT_TEXT="default_input_text"

# Define the command to run your Python script when the container starts
CMD ["python", "run_model.py", "--seed-prompt", "${SEED_PROMPT}", "--input-text", "${INPUT_TEXT}"]
