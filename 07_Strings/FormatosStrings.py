# Maneras de incluir valores de variable en texto print

# Signo de porcentaje
mass_percentage = "1/6"
print("On the Moon, you would about %s of your weight on Earth" % mass_percentage)

# Usando varios valores
print("""Both sides of the %s get the same amount of sunlight,
 but only one side is seen from %s because
 the %s rotates around its own axis when it orbits %s.""" % ("Moon", "Earth", "Moon", "Earth"))

# .format()
# Usa llaves ({}) como marcadores de posición dentro de una cadena
# y utiliza la asignación de variables para remplazar texto.
mass_percentage = "1/6"
print("On the Moon, you would weigh about {} of your weight on Earth". format(mass_percentage))

print("""You are lighter on the {0}, because on the {0}
 you would weigh about {1} of your weight on Earth""".format("Moon", mass_percentage))
# En lugar de usar llaves vacias la sustitución consiste en usar números 
# para indicar el índice de la variable {0}

# Para mejorar la legibilidad, se usan argumentos clave en .format() y,
# despues se hace referencia a los mismos argumentos entre llaves:
print("""You are lighter on the {moon}, because on the {moon}
 you would weigh about {mass} of your weight on Earth""".format(moon="Moon", mass=mass_percentage))


# Cadenas f-strings
print(f"On the Moon, you would weigh about {mass_percentage} of your weight on Earth")
# Las variables se incluyen entre llaves y la cadena debe usar el prefijo f.

#Con f-strings, no es necesario asignar un valor a una variable de antemano.
print(f"On the Moon, you would weigh about {round(100/6, 1)}% of your weight on Earth")

subject = "interesting facts about the moon"
print(f"{subject.title()}")