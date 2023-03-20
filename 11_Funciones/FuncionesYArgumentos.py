# Creación de una función sin argumentos
def rocket_parts():
    print('payload, propellant, structure')

# Llamando la función anterior
rocket_parts()

# Usando un valor que devuelve una función
# Se asigna la salida de la función a una variable.
output = rocket_parts()

# Devolviendo la cadena de la función explicitamente para que no devuelva None
def rocket_parts():
    return 'payload, propellant, structure'
output = rocket_parts()
print(output)

# Argumentos
# La función any() recibe como argumento un objeto iterable y 
# devuelve True si algún elemento del objeto es True.
# De lo contrario, devuelve False:
any([True, False, False])
any([False, False, False])

# Si se llama a any() sin ningún argumento, se genera un mensaje de error.
# Este explica que necesita al menos un argumento
 # any()  

# Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
# TypeError: any() takes exactly one argument (0 given)

# Otra función con parámetros opcionales es str()
# Esta función crea una cadena a partir de un argumento
str()
# ''    Devuelve una cadena vacia
str(15) 
# '15'  Devuelve el argumento como cadena




