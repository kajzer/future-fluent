# Getting Your First LLM

The most effective way to learn prompt engineering is through hands-on experimentation. This guide focuses on practical methods to interact with large language models (LLMs), whether locally hosted on your hardware or via cloud-based providers. Below, we explore the ecosystem of tools, platforms, and interfaces available to start engaging with LLMs immediately.

!!! question "Don't worry"
    No need to worry if some of the terms are unfamiliar — we'll explain them in detail as we go along.

## Local vs. Hosted Models

### Local Models

Local models run entirely on your hardware, offering full control over data privacy and customization. Tools like [Ollama](https://ollama.com/){:target="_blank"} and [LM Studio](https://lmstudio.ai/){:target="_blank"} simplify local deployment by abstracting complex configurations, allowing users to download and run quantized models (e.g., Mistral-7B, Llama3-8B) with minimal setup. For example, Ollama’s Docker-inspired CLI enables one-line model pulls (ollama run llama2), while LM Studio provides a graphical interface for model management and experimentation.

Local deployment is ideal for sensitive applications, as no data leaves your device. However, hardware limitations such as VRAM for GPU offloading or RAM for CPU inference constrain model size and speed. For instance, a 7B-parameter model requires at least 8GB of RAM, while 70B models demand high-end GPUs or optimized quantization.

### Hosted Models

Hosted models, offered by providers like OpenAI, Anthropic, and Google, abstract infrastructure management, allowing users to access state-of-the-art models (e.g., GPT-4, Claude 3.7) via APIs or UI (graphical interface). These services excel in ease of use and scalability, as they handle hardware optimization, updates, and latency.

However, reliance on third-party APIs or UIs introduces privacy risks, as queries and outputs may be logged or used for training. Costs can also escalate with high usage or pro subscriptions.

## UI Options for Interacting with LLMs

Beginner-friendly UIs like LM Studio and Jan offer intuitive graphical environments for local model interaction. These tools support features such as:

- Model browsing and downloading from repositories like Hugging Face.
- Chat interfaces with persistent conversation histories.
- Parameter tuning (temperature, top-p sampling) for output customization.

For collaborative or multi-user scenarios, Open WebUI provides a self-hosted web interface with user authentication and document retrieval (RAG) capabilities. Meanwhile, SillyTavern and AnythingLLM cater to advanced users, offering plugin systems for image generation, web searching, and API integrations.

!!! danger "Warning"
    There are some concerns associated with certain locally hosted UIs. For example, while LM Studio does not appear to connect to the internet after downloading a model and explicitly states on its homepage, "The app does not collect data or monitor your actions. Your data stays local on your machine" questions have been raised regarding its terms of use, which may warrant careful review before adoption.

## Conclusion: Choosing Your Starting Point

For beginners, hosted models lower the barrier to entry by eliminating setup complexity. Platforms like OpenAI provide free tiers for experimentation. As proficiency grows, transitioning to local models via Ollama or LM Studio offers greater control and cost savings for specialized tasks.

!!! warning "Choosing UI"
    If you'd like to follow along with lessons such as parameter tuning for LLMs, we recommend selecting an environment that supports this functionality. Some free-tier hosted model providers may limit or obscure access to such features. While we’ll offer some recommendations, please note that these are current as of the time of writing, and you should verify their capabilities independently.

## Recommendations

The following options are presented in order of increasing complexity, starting with those that are the easiest to set up and progressing to more advanced configurations.

### Hosted Free UI

The simplest option is to use a hosted, free user interface, with platforms like [ChatGPT](https://chatgpt.com/){:target="_blank"} and [Claude](https://claude.ai/){:target="_blank"} being popular choices. However, as of this writing, access to more advanced features is typically limited to paid users. For those looking to explore these capabilities at no cost, we recommend using [Google AI Studio](https://aistudio.google.com/){:target="_blank"}, which provides broad access to advanced options within a free tier.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/aistudio.png){: style="height:65%;width:65%"}
    <figcaption>Google AI Studio</figcaption>
</figure>

### Self-Hosted LLM with UI

!!! tip "Requirements"
    This option requires a high-performance machine, ideally equipped with a GPU. While it is possible to run smaller models using quantization, which can significantly improve speed and reduce resource requirements, it's important to note that the quality of the model's responses may be lower.

Visit the [LM Studio](https://lmstudio.ai/){:target="_blank"} website and download the version that is compatible with your operating system. Once installed, launch the application. 

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio.png){: style="height:65%;width:65%"}
    <figcaption>LM Studio</figcaption>
</figure>

Please note that it will not function immediately, as it requires a model to run. To get started, navigate to the :fontawesome-solid-magnifying-glass: "Discover" tab (on the left side of the app) and select a model and quantization option for example `Q4_K_M` to download. For starting, we recommend a smaller model such as `Mistral-7B-Instruct-v0.3-GGUF`, which balances performance and resource requirements.
If you don't have access to a GPU but still wish to run a model locally, you can try a lightweight option such as `Gemma 2B` or `Gemma 4B QAT` (Quantization Aware Training). These models are designed to be more efficient and can run on CPU-only systems, though performance and response speed may vary depending on your hardware.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-gemma.png){: style="height:65%;width:65%"}
    <figcaption>Search & Download model in LM Studio</figcaption>
</figure>

After the download is complete, you can go to :material-chat-outline: Chat and load the model (dropdown at the top of the chat screen saying "Select a model to load")

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-chat.png){: style="height:65%;width:65%"}
    <figcaption>Loading Model</figcaption>
</figure>

and begin interacting with it.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-chat-interact.png){: style="height:65%;width:65%"}
    <figcaption>Interacting with the LLM</figcaption>
</figure>

After you are finished remember to eject the model and close the app.

### UI with OpenRouter Free and Paid LLMs

To use [Jan.ai](https://jan.ai/){:target="_blank"} (or a similar platform like [AnythingLLM](https://anythingllm.com/){:target="_blank"}) with OpenRouter, a few additional setup steps are required:

- Download and install [Jan.ai](https://jan.ai/){:target="_blank"} from its official website.
- Register for an account at [OpenRouter](https://openrouter.ai/){:target="_blank"}.
- Once logged in, navigate to Settings → API Keys on the OpenRouter website.
- Generate a new API key and copy it immediately. It will look something like:
`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`.

!!! tip "API Key"
    You can only view the key once, so if you forget to copy it, simply generate a new one.

- In the Jan.ai application, go to Settings → Remote Engine → OpenRouter, and paste your API key into the appropriate field.
- You can now start a new thread and select a model by clicking the model selector at the bottom of the chat window. Choose Cloud → type “free”, then scroll to locate OpenRouter and select your model. You need to check terms & conditions on the model since some free models are avaliable only to users that made a purchase.

!!! tip "Free model"
    For example, you can select:
    `nvidia/llama-3.3-nemotron-super-9b-v1:free`

Optional – Using Google Models for Free:
If you prefer using Google hosted models, you can obtain a free API key by clicking "Get API Key" at the top of the [Google AI Studio](https://aistudio.google.com/){:target="_blank"} interface and following the same steps. Just be sure to choose Google as the provider instead of OpenRouter.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/jan.png){: style="height:65%;width:65%"}
    <figcaption>Jan</figcaption>
</figure>

### Local Options for Advanced Users

If you want to use an LLM directly from the terminal, with tools like cURL or from a programming language such as Python, you can explore additional methods in the [Inference and Serving](../../../Docs/LLM/Inference_and_Serving/index.md) section.

### More Options

You can check more UI, inference engines, etc. options and free LLM API like OpenRouter in [LLM Resources](../../../Docs/LLM/Resources/index.md)

## What next?

Experiment with the LLM you’ve just installed, then continue to the next section on Prompt Engineering.

## Bonus

If you're feeling nostalgic and looking to add a bit of fun to your experience, consider installing [Clippy](https://felixrieseberg.github.io/clippy/#window-video){:target="_blank"} and interacting with it through an interface. Enjoy!

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/Clippy_en.png){: style="height:65%;width:65%"}
    <figcaption>Clippy in action</figcaption>
</figure>
