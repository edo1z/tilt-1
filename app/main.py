from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello, Tilt + FastAPI! 3"}


@app.get("/ping")
def ping():
    return {"pong": True}


@app.get("/hello")
def hello():
    return {"message": "Hello!!!2"}
