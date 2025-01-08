from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello, Tilt + FastAPI!"}


@app.get("/ping")
def ping():
    return {"pong": True}
