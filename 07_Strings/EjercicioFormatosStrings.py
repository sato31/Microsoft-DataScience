name = "Ganymede"
planet = "Mars"
gravity = "1.43"

# Creación de una plantilla
template = """Gravity Facts about {name}
----------------------------------------
Planet Name: {planet}
Gravity on {name}: {gravity} m/s2"""

# Se imprime la plantilla con los valores de las variables
print(template.format(name=name, planet=planet, gravity=gravity))

