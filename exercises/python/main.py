# from process_data import cars                       # importa a variável cars do arquivo process_data.py

cars = [
    {"name": "Civic",   "marca": "Honda",  "year": 2021, "color": "black", "engine": "2.0"},
    {"name": "Accord",  "marca": "Honda",  "year": 2021, "color": "white", "engine": "2.0"},
    {"name": "HRV",     "marca": "Honda",  "year": 2021, "color": "black", "engine": "1.8"},
    {"name": "City",    "marca": "Honda",  "year": 2021, "color": "white", "engine": "1.5"},
    {"name": "CRV",     "marca": "Honda",  "year": 2021, "color": "black", "engine": "2.4"},
    {"name": "Fit",     "marca": "Honda",  "year": 2022, "color": "white", "engine": "1.5"},
    {"name": "Pilot",   "marca": "Honda",  "year": 2021, "color": "black", "engine": "3.5"},
    {"name": "Corolla", "marca": "Toyota", "year": 2020, "color": "white", "engine": "2.0"},
    {"name": "Camry",   "marca": "Toyota", "year": 2021, "color": "black", "engine": "2.5"},
    {"name": "RAV4",    "marca": "Toyota", "year": 2022, "color": "white", "engine": "2.5"},
    {"name": "Yaris",   "marca": "Toyota", "year": 2020, "color": "black", "engine": "1.5"},
    {"name": "Hilux",   "marca": "Toyota", "year": 2021, "color": "white", "engine": "2.8"},
    {"name": "Prius",   "marca": "Toyota", "year": 2022, "color": "black", "engine": "1.8"},
    {"name": "Fielder", "marca": "Toyota", "year": 2020, "color": "white", "engine": "3.5"}
]

def get_cars(year, marca):                                                                                    # define a função e recebe o parametro que queremos buscar

    results = []                                                                                               # cria a lista vazia para receber o que atende ao filtro

    for car in cars:                                                                                            # para cada carro na lista

        if car["year"] == year and car["marca"].lower() == marca.lower():                    # se o grupo cars do outro arquivo tiver a chave == ao parametro 
            results.append(car)                                                                                 # resulta em alguma coisa

    results = sorted(results, key=lambda car: car["name"])

    return results                                                                                                  # retorna o resultado

select_cars = get_cars(2021, "honda")                                                                   # executa a função buscando carros com o parametro definido na linha 9 e salva o resultado em select_cars

for car in select_cars:                                                                                         # para os carros informados na variavel select_cars, puxa pela funcao a marca escolhida
    print(car["marca"], car["name"], car["year"])                                                                 # imprime as informaçoes dos carros selecionados do dicionario que cada carro representa

