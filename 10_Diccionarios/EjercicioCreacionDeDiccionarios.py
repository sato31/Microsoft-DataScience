planet = {
    'name': 'Mars',
    'moons': 2
}

# Mostar datos del planeta
print(f'{planet["name"]} has {planet["moons"]} moon(s)')

# Añadir información de la circunferencia
planet['circumference (km)'] = {
    'polar': 6752,
    'equatorial': 6792
}

print(f"{planet['name']} has a polar circumference of {planet['circumference (km)']['polar']}")


