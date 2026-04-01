cars = [
    {"name": "Civic",   "marca": "Honda", "year": 2020},
    {"name": "Fit",     "marca": "Honda", "year": 2019},
    {"name": "City",    "marca": "Honda", "year": 2022},
    {"name": "HRV",     "marca": "Honda", "year": 2021},
    {"name": "Corolla", "marca": "Toyota", "year": 2021},
]

def get_cars(marca, year):

    filtered = []

    for car in cars:
        # =========================
        # 🔹 CENÁRIO 1 - Ano mínimo
        # =========================
        if car["marca"].lower() == marca.lower() and car["year"] >= year:
      # if car["marca"].lower() == marca.lower() and car["year"] == year:
      # if car["marca"].lower() == marca.lower():
            filtered.append(car)

    sorted_cars = sorted(filtered, key=lambda car: car["year"], reverse=True)
  # sorted_cars = sorted(filtered, key=lambda car: car["name"])
  # sorted_cars = sorted(filtered, key=lambda car: (car["year"], car["name"]), reverse=True)
 
    top = sorted_cars[:2]

    return top

result = get_cars("Honda", 2020)

for car in result:
    print(car["name"], car["year"])
