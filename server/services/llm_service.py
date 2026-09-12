import google.generativeai as genai
from config import Settings

setting = Settings()


class LLMService:
    def __init__(self):
        genai.configure(api_key=setting.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("gemini-3.5-flash-lite")

    def generate_response(self, query: str, search_result: list[dict]):
        context_text = "\n\n".join(
            [
                f"Source ${i+1} {result['url']}:\n${result['content']}"
                for i, result in enumerate(search_result)
            ]
        )

        full_prompt = f"""
        Context from web search:
        {context_text}
        
        Query: {query}
        
        Please provide a comprehensiv, detailed, well-cited accurate response using the above context. Think and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledge until it is absolutely necessary. Use a clear and easy english language for understanding.
        """

        response = self.model.generate_content(full_prompt)

        return response.text
