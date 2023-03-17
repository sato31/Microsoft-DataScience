
# Segmentación de Listas
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
planets_before_earth = planets[0:2] # Muestra los planetas antes de la tierra
# Se crea una lista que comienza en el índice inicial y termina antes del índice final (sin incluirlo)
print(planets_before_earth)

planets_after_earth = planets[3:8]
# Ya que la indexación comienza en 0, se muestra Neptuno que es el 7
print(planets_after_earth)

# Si no se coloca el índice final, se asume que se mostrará hasta el final de la lista
planets_after_earth = planets[3:]
print(planets_after_earth) 

# Combinación de listas (+)
# Cree dos listas y  únalas mediante + para crear una lista.
amalthea_group = ["Metis", "Adrastea", "Amalthea", "Thebe"]
galilean_moons = ["Io", "Europa", "Ganymede", "Callisto"]

regular_satellite_moons = amalthea_group + galilean_moons
print("The regular satellite moons of Jupiter are", regular_satellite_moons)

# Ordenación de listas .sort()
# Con este método se ordenara una lista de cadenas en orden alfabético
# y una lista de números en orden numérico.
regular_satellite_moons.sort()
print("The regular satellite moons of Jupiter are", regular_satellite_moons)

# Para ordenar una lista en orde inverso se usa .sort(reverse=True)
regular_satellite_moons.sort(reverse=True)
print("The regular satellite moons of Jupiter are", regular_satellite_moons)

# EL MÉTODO .sort() SI MODIFICA LA LISTA ACTUAL.
