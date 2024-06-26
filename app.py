import json
import uvicorn
from fastapi import FastAPI, Depends, Header, Request, Response


app = FastAPI(title="test-app", description="Testing", version="1.0.0")


@app.post("/Test")
async def test_api(
    request: Request
):
    resp = Response(json.dumps({"Test": "Check"}))
    resp.headers["Content-Type"] = "application/json"
    return resp


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=7000)