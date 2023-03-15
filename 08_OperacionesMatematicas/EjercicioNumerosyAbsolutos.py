# Calcula la distancia entre dos planetas usando la entrada de usuario
first_planet_input = input('Enter the distance from the sun for the first planet in KM')
second_planet_input = input('Enter the distance from the sun for the second planet in KM')
# Se convierten los strings recibidos en los inputs en enteros
first_planet = int(first_planet_input)
second_planet = int(second_planet_input)

# Se obtiene el valor absoluto de la diferencia entre dos planetas
distance_km = abs(second_planet - first_planet)
print(distance_km)