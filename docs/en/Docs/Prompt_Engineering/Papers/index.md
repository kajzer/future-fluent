# Prompt Engineering Papers

---

## Prompting Science Report 1: Prompt Engineering is Complicated and Contingent 
[[arxiv](https://arxiv.org/abs/2503.04818)] [[pdf](https://arxiv.org/pdf/2503.04818)]

A short report exploring how benchmarking and prompting strategies impact Large Language Model (LLM) performance. It highlights that there’s no universal standard for benchmarks and that prompting techniques—like politeness or constraints—can have unpredictable effects depending on the context.

??? abstract "AI Key Takeaways"
    
    1. **Benchmarking Standards Vary**:
    
        Accuracy thresholds (100%, 90%, 51%) significantly affect model evaluations. The choice depends on the application's tolerance for errors.

    2. **Prompt Engineering is Unpredictable**:
    
        Techniques like politeness and formatting yield inconsistent results. Formatting improves performance, but politeness varies by context and question.

    3. **AI Response Consistency**:
    
        Models like GPT-4o and GPT-4o-mini show variability in responses. Repeated sampling (e.g., 100 attempts/question) offers better insights than single-instance testing.

    4. **Model Comparison**:
    
        GPT-4o generally performs better than GPT-4o-mini, but differences are small and only significant at lower accuracy thresholds.

    5. **Prompting Formats Matter**:
    
        Explicitly structured prompts enhance accuracy; unformatted prompts degrade performance.

    6. **Recommendations**:
    
        Adopt repeated testing methods.
        Tailor benchmarks and prompts to specific applications for better results.

    **Conclusion**:
    
    AI benchmarking and prompt design are context-sensitive and require methodological rigor to address variability and inconsistency effectively.

---
