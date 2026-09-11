from typing import List
from sentence_transformers import SentenceTransformer
import numpy as np


class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-miniLM-L6-V2")

    def sort_source(self, query: str, search_results: List[dict]):
        relevant_docs = []
        query_embedding = self.embedding_model.encode(query)

        print(query_embedding)
        for res in search_results:
            if not res.get("content"):
                continue
            result_embedding = self.embedding_model.encode(res["content"])

            # print(result_embedding)

            similarity = np.dot(query_embedding, result_embedding) / (
                np.linalg.norm(query_embedding) * np.linalg.norm(result_embedding)
            )

            res["relevance_score"] = similarity

            # print(similarity)

            if similarity > 0.3:
                relevant_docs.append(res)

        return sorted(relevant_docs, key=lambda x: x["relevance_score"], reverse=True)
