def distance_from_earth(destination):
    if destination == "Moon":
        return "238,855"
    else:
        return "Unable to compute to that destination"

# Se llama a la función dentro de un print para que muestre su salida
print(distance_from_earth('Moon'))
print(distance_from_earth('Mars'))
# Se le pasan distintos argumentos para comprobar su comportamiento.

# Varios argumentos necesarios
# Función que calcúla cuántos días de tardarán en llegar a un destino,
# dadas la distancia y una velocidad constante:
def days_to_complete(distance, speed):
    hours = distance / speed
    return hours/24

# Se llama a la función indicandole sus parámetros:
print(days_to_complete(238855, 75)) 

# Funciones como argumentos
# Asigna la función a una variable y esta se pasa a otra función como argumento
total_days = days_to_complete(238855, 75)
print(round(total_days)) 

# Pasando la función sin ser asignada a una variable
print(round(days_to_complete(238855, 75)))