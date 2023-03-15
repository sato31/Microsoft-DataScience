# Pedir al usuario ingresar el numero de parsecs a convertir a lightyears

parsecs_input = input("Input number of parsecs:")
parsecs = int(parsecs_input)
lightyears = 3.26 * parsecs
print(str(parsecs) + " parsecs is " + str(lightyears) + " lightyears")