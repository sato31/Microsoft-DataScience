## MÉTODOS

# TITLE
# Convierte en Mayúscula la primer letra de cada palabra de la cadena
heading = "temperatures and facts about the moon"
print(heading.title())


# .split()
# Separa la cadena en cada espacio. Crea una lista de todas las 
# palabras separadas por un espacio.
temperatures = """Daylight: 260 F
 Nighttime: -280 F""" 
print(temperatures.split())

# Se puede indicar como argumento el caracter de separación de la cadena
print(temperatures.split('\n'))


# Búsqueda 
# Se usa el operador in para detectar si existe un caracter o grupo
# de caracteres determinados en una cadena.
print("Moon" in "This text will describe facts and challenges with space travel")
print("Moon" in "This text will describe facts about the Moon")


# .find()
# Busca la posición de una palabra especifica en una cadena.
temperatures = """Saturn has a daytime temperature of -170 degrees Celsius,
 while Mars has -28 Celsius."""
print(temperatures.find("Moon"))
# Devolverá -1 ya que no se encuentra la palabra

print(temperatures.find("Mars"))
# Devuelve la posición donde "Mars" aparece en la cadena, en este caso 65.


# .count()
# Devuelve el número total de repeticiones de una palabra determinada
print(temperatures.count("Mars"))
print(temperatures.count("Moon"))


#.lower()
# Convierte toda la cadena a minúsculas
print("The Moon And The Earth".lower())


# .upper
# Convierte todos los caracteres a Mayúsculas
print("The Moon And The Earth".upper())

# Estos métodos son útiles ya que Python puede distinguir 
# entre Mayusculas y minusculas en una cadena.
# Antes de buscar contenido en una cadena, se recomienda convertirla
# a minusculas para no impedir una coincidencia.


#Comprobación del contenido
# Puede usarse split() para extraer contenido de una cadena
temperatures = "Mars Average Temperature: -60 C"
# Si se desea extraer la temperatura puede ser de la siguiente forma:
parts  =temperatures.split(':')
print(parts)
print(parts[-1]) # -1 devuelve el ultimo elemento de la lista

# Si el texto es irregular no es posible usar los mismos métodos
# de división para obtener el valor.
# Se debe recorrer en bucle los elementos y comprobar si los valores 
# son de un tipo determinado:
mars_temperature = "The highest temperature on Mars is about 30 C"
for item in mars_temperature.split():
    if item.isnumeric():
        print(item) 
# .isnumeric() y .isdecimal() pueden buscar cadenas que parezcan decimales.
# .isnumeric() no funciona para numeros negativos ya que '-' 
# no es un caracter numérico.


# .startswith()
# Comprueba si la cadena comienza con el prefijo indicado
print("-60".startswith('-'))

# .endswith()
# Comprueba el último caracter de una cadena
if "30 C".endswith("C"):
    print("This temperature is in Celsius")

# .replace() 
# Para reemplazar texto
print("Saturn has a daytime temperature of -170 degrees Celsius, while Mars has -28 Celsius.".replace("Celsius", "C"))

text = "Temperatures on the Moon can vary wildly."
print("temperatures" in text) #Devolverá False
print("temperatures" in text.lower()) #Devolverá True


# .join()
# Agrupa caracteres o palabras contenidos en un elemento iterable,
# como una lista de Python
moon_facts = ["The Moon is drifting away from the Earth", "On average, the Moon is moving about 4cm every year"] 
print('\n'.join(moon_facts))
