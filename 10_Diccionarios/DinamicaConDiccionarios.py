
# Recuperación de todas las claves y valores .keys()
rainfall = {
    'october': 3.5,
    'november': 4.2,
    'december': 2.1
}

# Mostrar la lista de todas las precipitaciones
for key in rainfall.keys():
    print(f"{key}: {rainfall[key]}cm")

# Comprobar la existencia de una clave en un diccionario
if 'december' in rainfall:
    rainfall['december'] = rainfall['december'] + 1
else:
    rainfall['december'] = 1
# Como diciembre existe, el valor será 3.1

# Recuperación de todos los valores values()
total_rainfall = 0
for value in rainfall.values():
    total_rainfall = total_rainfall + value

print(f'There was {total_rainfall}cm in the last quarter')


