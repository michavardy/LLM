# Goal
- this project aims to test out LLM's of different types, 
- currently the LLM will only support zephyr-7b-beta
- this project will run in dockers, and be availble to use as a sort of executable for other scripts,
- this docker will run using accelerated GPU Intel Corporation HD Graphics 630
- this will be done using the --privileged flag


## Build
```bash
docker build -t my_container_name .
docker run --rm --privileged -e SEED_PROMPT="your_seed_prompt" -e INPUT_TEXT="your_input_text" my_container_name
```

## Use
```bash
docker run -e SEED_PROMPT="seed_prompt_1" -e INPUT_TEXT="input_text_1" your_image_name
docker run -e SEED_PROMPT="seed_prompt_2" -e INPUT_TEXT="input_text_2" your_image_name
docker run -e SEED_PROMPT="seed_prompt_3" -e INPUT_TEXT="input_text_3" your_image_name

```

