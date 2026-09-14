import asyncio

from fastapi import FastAPI, WebSocket
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService
from services.llm_service import LLMService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")

        search_result = search_service.web_search(query)
        sorted_result = sort_source_service.sort_source(query, search_result)

        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_results", "data": sorted_result})

        for chunk in llm_service.generate_response(query, sorted_result):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})

    except:
        print("Unexpected error occured")
    finally:
        await websocket.close()


@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_result = search_service.web_search(body.query)
    print(search_result)

    sorted_result = sort_source_service.sort_source(body.query, search_result)
    print(sorted_result)

    response = llm_service.generate_response(body.query, sorted_result)

    return response
