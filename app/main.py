import random

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Vehicle Telemetry API")

class Telemetry(BaseModel):
    vehicle_id: str
    speed: float
    engine_temp: float
    fuel_level: float


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/telemetry")
def receive_telemetry(data: Telemetry):
    risk = "LOW"
    if data.engine_temp > 110:
        risk = "HIGH"

    return {
        "vehicle_id": data.vehicle_id,
        "risk_level": risk,
        "message": "Telemetry processed"
    }


@app.get("/vehicle/{vehicle_id}")
def vehicle_status(vehicle_id: str):
    return {
        "vehicle_id": vehicle_id,
        "speed": random.randint(0,180),
        "engine_temp": random.randint(70,120),
        "fuel_level": random.randint(10,100)
    }