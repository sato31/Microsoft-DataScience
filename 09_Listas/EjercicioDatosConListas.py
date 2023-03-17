
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

# Pedir al usuario el nombre de un planeta
user_planet = input("Please enter the name of the planet (with a capital letter to start)")

# Encontrar la localización del planeta seleccionado
planet_index = planets.index(user_planet)

# Mostrar planetas mas cercanos al sol
print("Here are the planets closer than " + user_planet)
print(planets[0:planet_index])

# Mostrar planetas mas lejanos al sol
print("Here are the planets further than " + user_planet)
print(planets[planet_index + 1 :])