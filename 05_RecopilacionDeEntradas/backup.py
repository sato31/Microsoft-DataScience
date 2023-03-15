import sys

print(sys.argv)
print(sys.argv[0])  # NOMBRE DEL PROGRAMA
print(sys.argv[1]) # PRIMER ARGUMENTO

# sys.argv es una matriz o estructura de datos que contiene muchos elementos.
# La primera posición, que se indica como 0 en la matriz, contiene el nombre del programa. 
# La segunda posición, 1, contiene el primer argumento. 
# Si el programa backup.py contiene el código anterior y se ejecuta asi:
# python3 backup.py 2023-01-01
# Entonces, se obtendrá la siguiente salida en consola:
#
# ['backup.py', '2023-01-01'] 
# backup.py
# 2023-01-01
#
