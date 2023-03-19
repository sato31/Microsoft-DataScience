
# Creación de un Diccionario
# Un diccionario es una colección de pares clave-valor
# diccionario = {'clave': valor}
planet = {'name' : 'Earth',
          'moons' : 1}

# Lectura de valores dentro de un diccionario .get()
print(planet.get('name'))
# Tambien puede pasarse la clave entre corchetes sin utilizar .get():
print(planet['name'])

# Si una clave no esta disponible, .get() devuelve None y [] genera un error KeyError.
# wibble = planet.get('wibble')   # Returns None
# wibble = planet['wibble']   # Throws KeyError 

# Modificación de valores de diccionario .update()
planet.update({'name': 'Makemake'})
# Tambien se pueden usar corchetes
planet['name'] = 'Makemake'

# Modificando con update varios valores
planet.update({
    'name': 'Jupiter',
    'moons': 79
})

# Modificando con llaves
planet['name'] = 'Jupiter'
planet['moons'] = 79

# Adición de claves
planet['orbital period'] = 433
print(planet)

# Eliminación de una clave .pop()
planet.pop('orbital period')
print(planet)

# Almacenando un dato complejo dentro de un dicionario
# Se añade un diccionario como valor
planet['diameter (km)'] = {
    'polar': 133709,
    'equatorial' : 142984
}
print(planet)

# Si se quieren recuperar valores de un diccionario anidado, se deben encadenar corchetes o llamadas a get()
print(f'{planet["name"]} polar diameter: {planet["diameter (km)"]["polar"]}')





