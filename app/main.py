from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Telemetry(BaseModel):
    vehicle_id: str
    speed: int
    engine_temp: int
    fuel_level: int


@app.get("/")
def home():
    return {"message": "Critical TechWorks app running 🚀"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/telemetry")
def receive_telemetry(data: Telemetry):
    # aqui depois vamos mandar para fila, db, etc
    return {
        "status": "received",
        "vehicle": data.vehicle_id
    }