from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)

def test_health():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"

def test_telemetry():
    payload = {
        "vehicle_id": "BMW123",
        "speed": 120,
        "engine_temp": 90,
        "fuel_level": 50
    }
    response = client.post("/telemetry", json=payload)
    assert response.status_code == 200
    assert response.json()["risk_level"] == "LOW"