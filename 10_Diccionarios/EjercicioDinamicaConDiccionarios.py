
planet_moons = {
    'mercury': 0,
    'venus': 0,
    'earth': 1,
    'mars': 2,
    'jupiter': 79,
    'saturn': 82,
    'uranus': 27,
    'neptune': 14,
    'pluto': 5,
    'haumea': 2,
    'makemake': 1,
    'eris': 1
    }

# Obtener una lista de lunas y el numero total de planetas
moons = planet_moons.values()
total_planets = len(planet_moons.keys())
print(total_planets)

# Determinar el promedio del numero de lunas
total_moons = 0
for moon in moons:
    total_moons = total_moons + moon

average = total_moons / total_planets

print(f'Each planet has an average of {average} moons')