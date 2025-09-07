from fastapi import FastAPI
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from starlette.responses import Response

app = FastAPI()
hits = Counter("hits_total", "Total hits")

@app.get("/")
def root():
    hits.inc()
    return {"status":"ok"}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)

