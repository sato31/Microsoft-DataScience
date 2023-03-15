sum = 1 + 2
print (sum) #6

print("Show this in the console")

# No funcionará porque no esta entre parentesis
# print["Show this in console"]

sum = 1 + 2 
product = sum * 2
print(product) #6

## TIPOS DE DATOS ##
planets_in_solar_system = 8 # int
distance_to_alpha_centaury = 4.367 # float lightyears
can_liftoff = True  # Boolean
shuttle_landed_on_the_moon = 'Apollo 11' #string

# Para conocer el tipo de dato de una variable
type(distance_to_alpha_centaury)    ## <class 'float'>

## OPERADORES ##
left_side = 10
right_side = 5
left_side / right_side # 2

# OPERADORES ARITMÉTICOS
# SUMA => +             RESTA => - 
# MULTIPLICACIÓN => *   DIVISIÓN => / 
#

# OPERADORES DE ASIGNACIÓN
# =     +=  Incremento  -= Decremento
# /=  =>  x/=2      x dividido por 2               
# *=  =>  x*=2      x multiplicado por 2
#

## FECHAS ##
from datetime import date   # Es necesario importar el módulo date
print(date.today()) # Impresión de la fecha de hoy

## CONVERSIÓN DE TIPOS DE DATOS ##

# No se puede imprimir ya que son 2 tipos de datos distintos.
# print("Today's Date is: " + date.today())

# Se debe de convertir la fecha en una cadena con str():
print("Today's date is: " + str(date.today()))





