# Función que devuelva la hora estimada de llegada
from datetime import timedelta, datetime

def arrival_time(hours=51):
    now = datetime.now()    # Obtiene la hora actual
    arrival = now + timedelta(hours=hours)  # Permite la operación
        # de suma que da como resultado un objeto de hora nuevo.
    return arrival.strftime("Arrival %A %H:%M") # Devuelve la
        # estimación arrival con formato de cadena

# Llamando a la función sin ningún argumento
print(arrival_time())   # Ya que la función tiene un argumento
    # de palabra clave, se utilizará como predeterminado al 
    # llamar la función.

# En cambio, si se le proporciona un argumento distinto al llamar
# a la función, este será el que se usará.
print(arrival_time(hours=5))

# Combianción de argumentos y argumentos de palabra clave
from datetime import timedelta, datetime

def arrival_time(destination, hours=51):
    now = datetime.now()
    arrival = now + timedelta(hours=hours)
    return arrival.strftime(f"{destination} Arrival: %A %H:%M")
# *Ya que se ha agregado un argumento necesario, ya no es posible
# llamar a la función sin ningún argumento*
# print(arrival_time()) # ERROR

# Se añade el parametro necesario para evitar el error:
print(arrival_time("Moon"))

# Pasando dos valores como argumentos:
print(arrival_time("Orbit", hours=0.13))


