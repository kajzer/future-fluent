# Inference and Serving

## Google Colab Notebook + HuggingFace

Jeśli chcesz tylko czysty notebook, skorzystaj z tego [linku](https://github.com/kajzer/future-fluent/blob/master/examples/notebooks/model_serving_colab_bnb_pl.ipynb){:target="_blank"}

!!! warning "Colab Runtime"
    Przed uruchomieniem kodu upewnij się, że środowisko wykonawcze Google Colab jest ustawione aby korzystać z akceleratora sprzetowego (np. GPU T4).

Przejdź do [Google Colab](https://colab.research.google.com/){:target="_blank"} i stwórz nowy notebook

Sprawdź czy dostępne jest GPU:

``` py
!nvidia-smi
```

Wynik wykonania powyższego polecenia powinien wyglądać podobnie do tego

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

``` py title="Zainstaluj paczki"
!pip install -q -U bitsandbytes
!pip install -q -U git+https://github.com/huggingface/transformers.git
!pip install -q -U git+https://github.com/huggingface/peft.git
!pip install -q -U git+https://github.com/huggingface/accelerate.git
!pip install -q -U hf_transfer
!pip install -q -U "huggingface_hub[cli]"
```

``` py title="Zaimportuj moduły"
import torch
import os
import transformers
import getpass
from transformers import AutoModelForCausalLM, BitsAndBytesConfig, AutoTokenizer
from IPython.display import display, Markdown, Latex


os.environ["HF_HUB_ENABLE_HF_TRANSFER"] = "1"
```

``` py title="Tylko dla gated models"
!huggingface-cli login # dla gated models
```

Ustaw domyślne urządzenie do inferencji

``` py
torch.set_default_device('cuda')
```

``` py
model_id = "speakleash/Bielik-4.5B-v3.0-Instruct" # (1)

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

1. :man_raising_hand: Zmień tą linijkę jeżeli chcesz skorzystać z innego modelu

Wynik powyższego powinien wyglądać następująco: `device(type='cuda', index=0)`

``` py title="Wywołaj model"
chat = [
    {"role": "system", "content": "Odpowiadaj krótko, precyzyjnie i wyłącznie w języku polskim."},
    { "role": "user", "content": "Cześć" },
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

W notebooku Colab możesz wyświetlać Markdown, jak poniżej

```py
display(Markdown(text))
```

Aby uzyskać więcej informacji na temat korzystania z Hugging Face, zapoznaj się z oficjalną [dokumentacją](https://huggingface.co/docs/transformers/en/quantization/bitsandbytes){:target="_blank"}

## Ollama

Istnieje kilka sposobów uruchomienia [Ollama](https://ollama.com/){:target="_blank"}, dzięki czemu możesz wybrać opcję najlepiej odpowiadającą Twoim potrzebom. Najprostsza metoda to uruchomienie [obrazu Dockera](https://hub.docker.com/r/ollama/ollama){:target="_blank"} z wybranym modelem i dostęp do niego za pomocą Pythona. Po dodatkowe opcje zapoznaj się z oficjalną [dokumentacją](https://github.com/ollama/ollama/tree/main/docs){:target="_blank"}.

```bash title="Docker z GPU"
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

```bash
docker exec -it ollama ollama run SpeakLeash/bielik-4.5b-v3.0-instruct:Q8_0
```

Możesz bezpośrednio z terminala wywołać LLM, używając cURL, lub korzystać z niego jako API w swoim kodzie, jak pokazano poniżej:

```py linenums="1"
from openai import OpenAI

client = OpenAI(
    base_url = 'http://host.docker.internal:11434/v1', # (1)
    api_key='ollama', # (2)
)

response = client.chat.completions.create(
  model="SpeakLeash/bielik-4.5b-v3.0-instruct:Q8_0",
  messages=[
    {"role": "system", "content": "Odpowiadaj krótko, precyzyjnie i wyłącznie w języku polskim."},
    {"role": "user", "content": "Cześć"},
  ]
)
print(response.choices[0].message.content)
# Cześć! Jak mogę Ci pomóc?
```

1. Użyj localhost zamiast `host.docker.internal` jeżeli nie łączysz się z innego obrazu Dockerowego
2. Wymagana, ale nie używane
