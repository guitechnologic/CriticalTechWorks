from process_data import cars

sorted_cars = sorted(cars, key=lambda p: p["color"], reverse=False)

top10 = sorted_cars[:10]

for p in top10:
    print(p["name"], p["year"], p["color"])