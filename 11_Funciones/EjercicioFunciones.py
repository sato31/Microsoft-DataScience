# Crear una función con 3 parametros que genere un reporte 
def generate_report(main_tank, external_tank, hydrogen_tank):
    output = f"""Fuel report:
    Main tank: {main_tank}
    External tank: {external_tank}
    Hydrogen Tank: {hydrogen_tank}"""

    print(output)

# Corriendo la función
generate_report(80, 70, 75)
