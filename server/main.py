from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService
from services.llm_service import LLMService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_result = search_service.web_search(body.query)
    # print(search_result)

    sorted_result = sort_source_service.sort_source(body.query, search_result)
    print(sorted_result)

    response = llm_service.generate_response(body.query, sorted_result)

    return response
