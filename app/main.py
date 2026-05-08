from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Telemetry(BaseModel):
    vehicle_id: str
    speed: int
    engine_temp: int
    fuel_level: int


def calculate_risk(data: Telemetry) -> str:
    if data.speed > 160 or data.engine_temp > 110:
        return "HIGH"
    elif data.speed > 130 or data.engine_temp > 95 or data.fuel_level < 15:
        return "MEDIUM"
    else:
        return "LOW"


@app.get("/")
def home():
    return {"message": "Critical TechWorks app running 🚀"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/telemetry")
def receive_telemetry(data: Telemetry):
    risk = calculate_risk(data)

    return {
        "status": "received",
        "vehicle": data.vehicle_id,
        "risk_level": risk
    }
