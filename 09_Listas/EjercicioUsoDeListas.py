
# Añadir planetas a una lista
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
print(planets)

# Mostrar el número de planetas
print("There are", len(planets), "planets")

# Añadir planetas a la lista, mostrar el número de planetas y 
# el último planeta de la lista.
planets.append("Pluto")
print("Actually, there are", len(planets), "planets")
print(planets[-1], "is the last planet")
