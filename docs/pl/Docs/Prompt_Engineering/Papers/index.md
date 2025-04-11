# Prompt Engineering Papery

---

## Prompting Science Report 1: Prompt Engineering is Complicated and Contingent 
[[arxiv](https://arxiv.org/abs/2503.04818)] [[pdf](https://arxiv.org/pdf/2503.04818)]

Krótki raport badający, jak strategie benchamrkowania i promptowania wpływają na wydajność dużych modeli językowych (LLM). Podkreśla, że nie istnieje uniwersalny standard benchmarków, a techniki promptowania — takie jak uprzejmość czy ograniczenia — mogą mieć nieprzewidywalne skutki w zależności od kontekstu.

??? abstract "AI Kluczowe wnioski"
    
    1. **Standardy benchmarków są zróżnicowane**:
    
        Progi dokładności (100%, 90%, 51%) znacząco wpływają na ocenę modeli. Wybór zależy od tolerancji aplikacji na błędy.

    2. **Inżynieria promptów jest nieprzewidywalna**:
    
        Techniki takie jak uprzejmość i formatowanie dają niespójne rezultaty. Formatowanie zwykle poprawia wydajność, natomiast wpływ uprzejmości zależy od kontekstu i pytania.

    3. **Spójność odpowiedzi AI**:
    
        Modele takie jak GPT-4o i GPT-4o-mini wykazują zmienność w odpowiedziach. Powtarzalne próbkowanie (np. 100 prób na pytanie) daje lepszy wgląd niż testowanie pojedyńczych pytań.

    4. **Porównanie modeli**:
    
        GPT-4o generalnie wypada lepiej niż GPT-4o-mini, jednak różnice są niewielkie i istotne głównie przy niższych progach dokładności.

    5. **Format promptów ma znaczenie**:
    
        Wyraźnie ustrukturyzowane prompty zwiększają dokładność, nieformatowane obniżają.

    6. **Rekomendacje**:
    
        Testuj wielokrotnie.
        Dostosuj benchmarki i prompty do konkretnych zastosowań, aby uzyskać lepsze wyniki.

    **Wnioski**:
    
    Benchmarki i projektowanie promptów dla AI są zależne od kontekstu i wymagają metodycznego podejścia, aby skutecznie radzić sobie ze zmiennością i niespójnością.

---
