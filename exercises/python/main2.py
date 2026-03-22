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
            filtered.append(car)

        # =========================
        # 🔹 CENÁRIO 2 - Ano exato
        # =========================
        # if car["marca"].lower() == marca.lower() and car["year"] == year:
        #     filtered.append(car)

        # =========================
        # 🔹 CENÁRIO 3 - Só marca
        # =========================
        # if car["marca"].lower() == marca.lower():
        #     filtered.append(car)

    # =========================
    # 🔹 ORDENAÇÃO 1 - Por ano (desc)
    # =========================
    sorted_cars = sorted(filtered, key=lambda car: car["year"], reverse=True)

    # =========================
    # 🔹 ORDENAÇÃO 2 - Por nome (A → Z)
    # =========================
    # sorted_cars = sorted(filtered, key=lambda car: car["name"])

    # =========================
    # 🔹 ORDENAÇÃO 3 - Ano + nome
    # =========================
    # sorted_cars = sorted(filtered, key=lambda car: (car["year"], car["name"]), reverse=True)

    # =========================
    # 🔹 TOP N
    # =========================
    top = sorted_cars[:2]

    return top


result = get_cars("Honda", 2020)

for car in result:
    print(car["name"], car["year"])