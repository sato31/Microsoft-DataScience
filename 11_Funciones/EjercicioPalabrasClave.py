# Función que reciba varios argumentos de palabra clave.
def fuel_report(**fuel_tanks):
    for name, value in fuel_tanks.items():
        print(f'{name}: {value}')

# Llamando a la función indicandole los parámetros:
fuel_report(main=50, external=100, emergency=60)