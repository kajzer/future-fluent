# Konfiguracja pierwszego modelu LLM

Najlepszym sposobem na naukę prompt engineeringu jest po prostu działanie i eksperymentowanie. Ten przewodnik skupia się na praktycznych metodach pracy z dużymi modelami językowymi (LLM), niezależnie od tego, czy uruchamiasz je lokalnie na własnym sprzęcie, czy korzystasz z rozwiązań chmurowych. Poniżej znajdziesz przegląd narzędzi, platform i interfejsów, które pozwolą Ci od razu zacząć przygodę z LLM-ami.

!!! question "Nie martw się"
    Spokojnie, jeśli jakieś pojęcia czy zwroty brzmią obco, nie ma się czym martwić. Wszystko wytłumaczymy w następnych rozdziałach.

## Loaklne vs. Hostowane Modele

### Lokalne Modele

Modele lokalne działają całkowicie na Twoim sprzęcie, dając Ci pełną kontrolę nad prywatnością danych i możliwością dostosowania wszystkiego pod siebie. Narzędzia takie jak [Ollama](https://ollama.com/){:target="_blank"} czy [LM Studio](https://lmstudio.ai/){:target="_blank"} upraszczają cały proces, dzięki nim nie musisz martwić się o większość ustawień, żeby uruchomić model (np. Mistral-7B lub Llama3-8B). Wystarczy kilka kliknięć albo jedna linijka w terminalu (np. `ollama run llama2`), żeby pobrać i uruchomić LLM.

Taki sposób uruchamiania modeli świetnie sprawdza się przy wrażliwych projektach, bo dane nigdy nie opuszczają Twojego urządzenia. Trzeba jednak pamiętać o ograniczeniach sprzętowych — np. do działania modelu 7B potrzebujesz co najmniej 8 GB RAM, a przy większych modelach (np. 70B) przyda się mocna karta graficzna lub specjalna wersja modelu z tzw. kwantyzacją.

### Hostowane Modele

Modele hostowane, oferowane przez firmy takie jak OpenAI, Anthropic czy Google, zdejmują z użytkownika cały ciężar zarządzania infrastrukturą. Dzięki nim możesz korzystać z najnowszych modeli (np. GPT-4 czy Claude 3.7) za pomocą API albo interfejsów graficznych. To rozwiązanie bardzo wygodne i łatwo skalowalne bo nie musisz się martwić o sprzęt czy aktualizacje, bo tym wszystkim zajmuje się dostawca.

Z drugiej strony, poleganie na zewnętrznych usługach wiąże się z ryzykiem, Twoje zapytania i odpowiedzi mogą być zapisywane lub wykorzystywane do dalszego trenowania modeli. Do tego, przy intensywnym używaniu API lub subskrypcjach premium, koszty mogą szybko rosnąć.

## Opcje interfejsów do pracy z LLM-ami

Interfejsy przyjazne dla początkujących, takie jak LM Studio i Jan, oferują intuicyjne środowiska graficzne do pracy z lokalnymi modelami. Te narzędzia wspierają funkcje takie jak:

- Przeglądanie modeli i pobieranie ich z repozytoriów, np. Hugging Face.
- Interfejsy czatowe z zapisaną historią rozmów.
- Dostosowywanie parametrów (np. temperatura, top-p sampling) generowania.

Do współpracy lub dla wielu użytkowników, Open WebUI oferuje samodzielnie hostowany interfejs webowy z funkcjami uwierzytelniania użytkowników oraz "document retrical" (RAG). Z kolei SillyTavern i AnythingLLM są skierowane do bardziej zaawansowanych użytkowników, oferując systemy pluginów do generowania obrazów, przeszukiwania internetu i integracji z API.

!!! danger "Uwaga"
    Pojawiały się pewne wątpliwości niektórych lokalnie uruchamianych interfejsach. Na przykład LM Studio, choć po pobraniu modelu nie łączy się z Internetem i wyraźnie deklaruje na stronie głównej: "The app does not collect data or monitor your actions. Your data stays local on your machine", to jednak pojawiły się pytania dotyczące jego warunków użytkowania. Warto więc dokładnie zapoznać się z regulaminem przed rozpoczęciem pracy z jakimkolwiek narzędziem.

## Podsumowanie: Od czego zacząć?

Dla początkujących, modele hostowane to najprostszy sposób na start, nie trzeba nic instalować ani konfigurować. Platformy takie jak OpenAI często oferują darmowe plany, które świetnie nadają się do nauki i testów. Gdy już poczujesz się pewniej, warto rozważyć przejście na modele lokalne przez Ollama lub LM Studio, które dają więcej swobody, prywatności i oszczędności przy bardziej wyspecjalizowanych zastosowaniach.

!!! warning "Wybór UI"
    Jeśli chcesz uczyć się razem z nami, np. jak dostosowywać parametry LLM-ów, warto wybrać środowisko, które na to pozwala. Niektóre darmowe wersje modeli hostowanych mogą ograniczać albo ukrywać dostęp do takich opcji. Podamy kilka narzędzi, ale pamiętaj, że jest to stan na moment pisania tego przewodnika, więc przed wyborem najlepiej samodzielnie sprawdzić, co dokładnie oferują.

## Rekomendacje

Poniższe opcje są ułożone według rosnącego poziomu trudności. Zaczynamy od najprostszych w konfiguracji, a kończymy na tych bardziej zaawansowanych, wymagających nieco więcej wiedzy technicznej.

### Hostowany interfejs z darmowym dostępem

Najprostsza opcja to skorzystanie z hostowanego, darmowego interfejsu użytkownika. Popularne platformy to  [ChatGPT](https://chatgpt.com/){:target="_blank"} i [Claude](https://claude.ai/){:target="_blank"}, ale możesz również porozmawiać z :eagle: [Bielikiem](https://bielik.ai/){:target="_blank"} przez UI. Trzeba jednak pamiętać, że w chwili pisania tego przewodnika dostęp do bardziej zaawansowanych funkcji zwykle wymaga płatnej subskrypcji. Jeśli chcesz eksplorować te możliwości bez ponoszenia kosztów, polecamy [Google AI Studio](https://aistudio.google.com/){:target="_blank"}, które w ramach darmowego planu udostępnia sporo zaawansowanych opcji do pracy z modelami.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/aistudio.png){: style="height:65%;width:65%"}
    <figcaption>Google AI Studio</figcaption>
</figure>

### Lokalny LLM z interfejsem graficznym

!!! tip "Wymagania Sprzętowe"
    Ta opcja wymaga mocniejszego sprzętu, najlepiej komputera z kartą graficzną (GPU). Co prawda można uruchamiać mniejsze modele w wersji "skwantyzowanej" (czyli zoptymalizowanej pod kątem szybkości i niższego zużycia zasobów), ale trzeba liczyć się z tym, że jakość odpowiedzi może być nieco niższa w porównaniu do pełnych wersji modeli.

Wejdź na stronę [LM Studio](https://lmstudio.ai/){:target="_blank"} i pobierz wersję odpowiednią dla Twojego systemu operacyjnego. Po zainstalowaniu, uruchom aplikację.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio.png){: style="height:65%;width:65%"}
    <figcaption>LM Studio</figcaption>
</figure>

Aplikacja nie zadziała od razu, najpierw trzeba pobrać model. Aby to zrobić, przejdź do zakładki :fontawesome-solid-magnifying-glass: "Discover" (znajdziesz ją po lewej stronie okna aplikacji), a następnie wybierz interesujący Cię model i wersję kwantyzacji, np. `Q4_K_M`, i kliknij pobierz. Na początek polecamy mniejszy model, taki jak `Bielik-11B-v2.5-Instruct` lub `Mistral-7B-Instruct-v0.3-GGUF`, oferuje on równowagę między jakością a wymaganiami sprzętowymi. Idealny do nauki i pierwszych eksperymentów. Jeśli nie masz dostępu do GPU, a mimo to chcesz uruchomić model lokalnie, możesz spróbować mniejszych modeli, takich jak `Bielik-4.5B-v3.0-Instruct-GGUF`, `Bielik-1.5B-v3.0-Instruct-GGUF` lub `Gemma 4B QAT` (Quantization Aware Training). Te modele są zaprojektowane z myślą o większej wydajności i mogą działać nawet na komputerach bez karty graficznej, choć ich szybkość i płynność odpowiedzi będą zależeć od możliwości Twojego sprzętu.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-bielik.png){: style="height:65%;width:65%"}
    <figcaption>Wyszukaj i pobierz model w LM Studio</figcaption>
</figure>

Po zakończeniu pobierania przejdź do zakładki :material-chat-outline: "Chat", a następnie w górnej części ekranu czatu wybierz model z rozwijanej listy („Select a model to load”), aby go załadować i rozpocząć rozmowę.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-chat-bielik.png){: style="height:65%;width:65%"}
    <figcaption>Załadowanie modelu</figcaption>
</figure>

i możesz z nim rozmawiać.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/lmstudio-chat-interact-bielik.png){: style="height:65%;width:65%"}
    <figcaption>Interkacja z LLM</figcaption>
</figure>

Po zakończeniu pracy pamiętaj, aby odmontować (eject) model i zamknąć aplikację. Dzięki temu zwolnisz zasoby systemowe i unikniesz niepotrzebnego obciążenia sprzętu.

### Interfejs przez OpenRouter — darmowe i płatne LLM-y

Aby korzystać z [Jan.ai](https://jan.ai/){:target="_blank"} (lub podobnej platformy, np. [AnythingLLM](https://anythingllm.com/){:target="_blank"}) z OpenRouterem, potrzebne są dodatkowe kroki konfiguracyjne:

- Pobierz i zainstaluj [Jan.ai](https://jan.ai/){:target="_blank"} z oficjalnej strony.
- Zarejestruj się na [OpenRouter](https://openrouter.ai/){:target="_blank"}.
- Po zalogowaniu się na stronie OpenRouter przejdź do Settings → API Keys.
- Wygeneruj nowy klucz API i od razu go skopiuj, będzie wyglądał mniej więcej tak:
`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`.

!!! tip "API Key"
    Klucz API możesz zobaczyć tylko raz — jeśli zapomnisz go skopiować, po prostu wygeneruj nowy.

- W aplikacji Jan.ai przejdź do Settings → Remote Engine → OpenRouter i wklej swój klucz API w odpowiednie pole. Dzięki temu aplikacja będzie mogła korzystać z modeli udostępnianych przez OpenRouter.
- Teraz możesz rozpocząć nowy wątek i wybrać model, klikając selektor modeli na dole okna czatu. Wybierz Cloud → wpisz „free”, a następnie przewiń, aby znaleźć OpenRouter i wybrać swój model. Pamiętaj, aby zapoznać się z warunkami korzystania z modelu, ponieważ niektóre darmowe modele są dostępne tylko dla użytkowników, którzy dokonali wcześniej jakiegokolwiek zakupu.

!!! tip "Darmowe modele"
    Możesz np. wybrać model:
    `nvidia/llama-3.3-nemotron-super-9b-v1:free`

Opcjonalnie – Korzystanie z modeli Google za darmo:
Jeśli wolisz korzystać z modeli Google, możesz uzyskać darmowy klucz API, klikając „Get API Key” na górze interfejsu [Google AI Studio](https://aistudio.google.com/){:target="_blank"}. Następnie postępuj zgodnie z tymi samymi krokami, ale pamiętaj, aby wybrać Google jako dostawcę, a nie OpenRouter.

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/jan.png){: style="height:65%;width:65%"}
    <figcaption>Jan</figcaption>
</figure>

### Lokalne modele dla zaawansowanych użytkowników

Jeśli chcesz używać LLM bezpośrednio z terminala, korzystając z narzędzi takich jak cURL lub z poziomu języka programowania, na przykład Python, możesz zapoznać się z dodatkowymi metodami w sekcji [Inference and Serving](../../../../pl/Docs/LLM/Inference_and_Serving/index.md).

### Więcej Opcji

Możesz sprawdzić więcej opcji interfejsów użytkownika, silników inferencyjnych i darmowych API, takich jak OpenRouter, przechodząc do [LLM Resources](../../../../pl/Docs/LLM/Resources/index.md)

## Co dalej?

Eksperymentuj z LLM, który właśnie zainstalowałeś, a następnie przejdź do kolejnej sekcji.

## Bonus

Jeśli masz ochotę na odrobinę nostalgii i zabawy, możesz zainstalować [Clippy’ego](https://felixrieseberg.github.io/clippy/#window-video){:target="_blank"}, załadować :eagle: Bielika (format GGUF np. `speakleash/Bielik-4.5B-v3.0-Instruct-GGUF` - jeżeli pobrałeś go przy pomocy LM Studio już znajduje się na Twoim dysku) i porozmawiać z nim za pomocą interfejsu. Miłej zabawy!

<figure markdown="span">
    ![Image title](../../../img/prompt_engineering/for_everyone/Clippy_pl.png){: style="height:65%;width:65%"}
    <figcaption>Clippy w akcji</figcaption>
</figure>
