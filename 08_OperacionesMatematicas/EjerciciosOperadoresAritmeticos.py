#  Calcular distancia entre 2 planetas teniendo las distancias entre
# ellos y el sol.

# Distancia entre el sol y 2 planetas distintos
first_planet = 149597870
second_planet = 778547200

# Se obtiene la diferencia de distancias entre los 2 planetas, expresada en Km
distance_km = second_planet - first_planet
print(distance_km)

# Se realiza la conversión de km a millas
distance_mi = distance_km / 1.609344
print(distance_mi)