# Argumentos de variable permitan pasar cualquier número de argumentos
# La sintaxis para usar argumentos de variable es agregar un asterisco
# como prefijo (*) antes del nombre del argumento.
def variable_length(*args):
    print(args)

# Probando la función pasando cualquier número o tipo de argumentos
variable_length()
variable_length("one", "two")
variable_length(None)

# Ejemplo. Función que calcula cuántos minutos quedan hasta el inicio,
# dado el tiempo que va a tardar cada paso:
def sequence_time(*args):
    total_minutes = sum(args)
    if total_minutes < 60:
        return f"Total time to launch is {total_minutes} minutes"
    else:
        return f"Total time to launch us {total_minutes/60} hours"
    
# Probando la función pasando cualquier número de argumentos
print(sequence_time(4, 14, 18))
print(sequence_time(4, 14, 48))

# Argumentos de palabra clave variable
# Sintaxis: Asterisco doble (**)
def variable_length(**kwargs):
    print(kwargs)

# Probando la función que imprime los nombres y valores pasados como kwargs
variable_length(tanks=1, day="Wednesay", pilots=3)

# Función de argumentos de palabra clave variable para notificar
# a astronautas asignados a la misión 
def crew_members(**kwargs):
    print(f"{len(kwargs)} astronauts assigned for this mission:")
    for title, name in kwargs.items():
        print(f"{title}: {name}")

# Probando la función
crew_members(captain="Neil Armstrong", pilot="Buzz Aldrin", command_pilot="Michael Collins")

# Si se pasan palabras clave repetidas producirán un error.
# crew_members(captain="Neil Armstrong", pilot="Buzz Aldrin", pilot="Michael Collins")
