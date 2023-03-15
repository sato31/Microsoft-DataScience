# EJERCICIO AND Y OR 
# Establecer las variables object size en 10 y proximity en 9000
# Si object_size es mayor a 5 y proximity es menor a 1000, mostrar una advertencia,
# de otro modo, mostrar que no es una amenaza#

object_size = 10
proximity = 9000

if object_size >= 5 and proximity < 1000:
    print("Evasive maneuvers required")
else:
    print("Object poses no threat")