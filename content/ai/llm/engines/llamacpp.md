title=llama.cpp
tags=ai, engine
summary=Widely used inference engine for running local models.
~~~~~~

[Source](https://github.com/ggml-org/llama.cpp) | [Deepwiki](https://deepwiki.com/ggml-org/llama.cpp)

## Related Implementations

- [llama-cpp-python](https://llama-cpp-python.readthedocs.io/en/latest/) - llama-cpp bindings for Python [Source](https://github.com/abetlen/llama-cpp-python)
- [ik_llama.cpp](https://github.com/ikawrakow/ik_llama.cpp) - llama.cpp fork with additional SOTA quants and improved performance
- [node_llama_cpp](https://github.com/withcatai/node-llama-cpp) - NodeJS bindings for llama.cpp

## Resources

### Articles/Blogs/Essays

- [Using OCR models with llama.cpp](https://huggingface.co/blog/ggml-org/using-ocr-models-with-llama-cpp)

## Tutorial

Install library: `pip install llama-cpp-python`

Locate your model: Make sure you have downloaded the specific GGUF version of your model (e.g., llama-2-7b.gguf) into a dedicated folder on your computer. Know the path: You will need the absolute path to this .gguf file.

This script initializes the model, runs a prompt, and generates the response token by token (streaming), which is best practice for LLMs.

        from llama_cpp import Llama

        # --- CONFIGURATION ---
        MODEL_PATH = "./path/to/your/model-name.gguf" 

        # Set the number of layers (or context size) if you know it, otherwise leave at None
        N_GPU_LAYERS = 0 # Use 0 for CPU only. For GPU acceleration, use a positive integer (e.g., 35)
        CONTEXT_SIZE = 4096

        # --- INITIALIZATION ---
        try:
            # Initialize the Llama model object
            llm = Llama(
                model_path=MODEL_PATH, 
                n_gpu_layers=N_GPU_LAYERS, # Offloads specified layers to GPU memory
                context_size=CONTEXT_SIZE
            )

        except Exception as e:
            print(f"Error loading model. Check your file path and installation.")
            print(f"Details: {e}")
            exit()

        # --- GENERATION FUNCTION ---
        def generate_response(prompt: str, max_tokens: int = 256):
            """Generates a response from the loaded LLM."""
            print("--- Sending Prompt ---")
            print(f"Prompt: {prompt}\n")

            # The llama.create_completion method is used for generating text
            output = llm.create_completion(
                prompt, 
                max_tokens=max_tokens,
                temperature=0.7, # Controls randomness (0.0 is deterministic)
                echo=False       # Don't repeat the prompt in the output
            )

            # Extract the generated text from the complex JSON-like structure
            generated_text = output['choices'][0]['text']
            return generated_text

        def generate_response_withtools(prompt: str):
            response = llm.create_chat_completion(
                messages = [
                    { "role": "system", "content": "Answer questions in a conversational style. Call functions with appropriate input when necessary." },
                    { "role": "user", "content": prompt }
                ],
                tools=[{
                    "type": "function",
                    "function": {
                    "name": "UserDetail",
                    "parameters": {
                        "type": "object",
                        "title": "UserDetail",
                        "properties": {
                        "name": {
                            "title": "Name",
                            "type": "string"
                        },
                        "age": {
                            "title": "Age",
                            "type": "integer"
                        }
                        },
                        "required": [ "name", "age" ]
                    }
                    }
                }],
                tool_choice={
                    "type": "function",
                    "function": { "name": "UserDetail" }
                }
            )

            
            return response

        if __name__ == "__main__":
            user_prompt = "Explain the concept of quantum entanglement using simple analogies."
            
            # Generate and print the response
            response = generate_response(user_prompt)
            
            print("==============================")
            print("🤖 Model Response:")
            print(response)

