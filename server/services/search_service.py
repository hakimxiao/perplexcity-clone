from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)


class SearchService:
    def web_search(self, query: str):
        results = []
        response = tavily_client.search(query, max_results=5)
        search_result = response.get("results", [])

        for res in search_result:
            downloaded = trafilatura.fetch_url(res.get("url"))
            content = trafilatura.extract(downloaded, include_comments=False)

            # print(content)
            results.append(
                {
                    "title": res.get("title", ""),
                    "url": res.get("url"),
                    "content": content,
                }
            )

        return results
