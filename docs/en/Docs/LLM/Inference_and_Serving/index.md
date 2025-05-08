# Inference and Serving

## Google Colab Notebook + HuggingFace

If you just want the clean notebook you can follow this [link](https://colab.research.google.com/github/kajzer/future-fluent/blob/main/examples/notebooks/model_serving_colab_bnb_en.ipynb){:target="_blank"}

!!! warning "Colab Runtime"
    Before running the code, ensure that the Google Colab runtime is set to use a GPU.

Go to [Google Colab](https://colab.research.google.com/){:target="_blank"} and create new notebook

Check if CUDA device is visible:

``` py
!nvidia-smi
```

The output should be similar to this:

```
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 550.54.15              Driver Version: 550.54.15      CUDA Version: 12.4     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Tesla T4                       Off |   00000000:00:04.0 Off |                    0 |
| N/A   46C    P8             10W /   70W |       0MiB /  15360MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
                                                                                         
+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```

``` py title="Install dependancies"
!pip install -q -U bitsandbytes
!pip install -q -U git+https://github.com/huggingface/transformers.git
!pip install -q -U git+https://github.com/huggingface/peft.git
!pip install -q -U git+https://github.com/huggingface/accelerate.git
!pip install -q -U hf_transfer
!pip install -q -U "huggingface_hub[cli]"
```

``` py title="Import modules"
import torch
import os
import transformers
import getpass
from transformers import AutoModelForCausalLM, BitsAndBytesConfig, AutoTokenizer
from IPython.display import display, Markdown, Latex


os.environ["HF_HUB_ENABLE_HF_TRANSFER"] = "1"
```

``` py title="Only for gated models"
!huggingface-cli login # for gated models
```

Set a default device to run LLM

``` py
torch.set_default_device('cuda')
```

``` py
model_id = "google/gemma-3-4b-it" # (1)

quantization_config = BitsAndBytesConfig(load_in_4bit=True)

model = AutoModelForCausalLM.from_pretrained(
    model_id,
    quantization_config=quantization_config,
    low_cpu_mem_usage=True,
    torch_dtype="auto",
    device_map="auto"
    )

tokenizer = AutoTokenizer.from_pretrained(model_id)
model.device
```

1. :man_raising_hand: Change this if you want a different model

Output should be similar to this: `device(type='cuda', index=0)`

``` py title="Run inferance on the model"
chat = [
    { "role": "user", "content": "Hi there" },
]
prompt = tokenizer.apply_chat_template(
    chat, 
    tokenize=False, 
    add_generation_prompt=True
    )

inputs = tokenizer.encode(
    prompt, 
    add_special_tokens=True, 
    return_tensors="pt"
    )
outputs = model.generate(
    input_ids=inputs.to(model.device),
    max_new_tokens=100
    )
text = tokenizer.decode(
    outputs[0],
    skip_special_tokens=True, 
    clean_up_tokenization_spaces=True
    )
```

In a Colab Notebook you can display Markdown as shown below

```py
display(Markdown(text))
```

For more information on using Hugging Face, please refer to the official [documentation](https://huggingface.co/docs/transformers/en/quantization/bitsandbytes){:target="_blank"}

## Ollama

There are several ways to run [Ollama](https://ollama.com/){:target="_blank"}, allowing you to choose the option that best fits your needs. The simplest method is to run a [Docker image](https://hub.docker.com/r/ollama/ollama){:target="_blank"} with your preferred model and access it via Python. For additional options, please refer to the official [documentation](https://github.com/ollama/ollama/tree/main/docs){:target="_blank"}.

```bash title="Docker with GPU support"
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```bash
docker exec -it ollama ollama run gemma3:4b-it-qat
```

You can either interact with the LLM directly in your terminal, with curl or use it as an API within your code, as demonstrated below.

```py linenums="1"
from openai import OpenAI

client = OpenAI(
    base_url = 'http://host.docker.internal:11434/v1', # (1)
    api_key='ollama', # (2)
)

response = client.chat.completions.create(
  model="gemma3:4b-it-qat",
  messages=[
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Hi there"},
  ]
)
print(response.choices[0].message.content)
# Hello! How can I help you today? 😊 Do you have a question, need some information, or just want to chat?
```

1. Use localhost insted of `host.docker.internal` if you are not connecting from other Docker image
2. Required, but unused
