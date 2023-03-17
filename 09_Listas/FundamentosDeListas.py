# Las listas almacenan una colección de valores #

# Creación de una lista
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

# Acceso a elementos de una lista por su índice
print("The First Planet is", planets[0])
print("The Second Planet is", planets[1])
print("The Third Planet is", planets[2])

planets[3]  = "Red Planet"
print("Mars is also known as", planets[3])

# Determinación de la longitud de una lista
number_of_planets = len(planets)
print("There are", number_of_planets, "planets in the solar system.")

# Agregar elementos a una lista
planets.append("Pluto")
number_of_planets = len(planets)
print("There are actually", number_of_planets, "planets in the solar system.")

# Eliminar valores de una lista
planets.pop()   # Quita el último elemento de la lista
number_of_planets = len(planets)
print("No, there are definitely", number_of_planets, "planets in the solar system,")

# Uso de índices negativos
# Los índices negativos comienzan al final de la lista y va hacia atrás.
# Un índice de -1 devuelve el último elemento de una lista.
# Un índice de -2 devuelve el penúltimo.
print("The last planet is", planets[-1])    # Neptune
print("The penultimate planet is", planets[-2]) # Uranus

# Búsqueda de una valor en una lista .index()
# Este método busca el valor y devuelve el índice de ese elemento en la lista.
# Si no encuentra ninguna coincidencia devuelve -1.
jupiter_index = planets.index("Jupiter")
print("Jupiter is the", jupiter_index + 1, "planet from the sun")





