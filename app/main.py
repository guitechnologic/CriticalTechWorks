from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Critical TechWorks app running 🚀"}

@app.get("/health")
def health():
    return {"status": "ok"}