# Suma
answer = 30 + 12
print(answer)

# Resta
difference = 30 - 12
print(difference)

# Multiplicación
product = 30 * 12
print(product)

# División 
quotient = 30 / 12
print(quotient)

# Uso de la división 
# Se convertirá un número expresado en segundos a minutos y segundos
seconds = 1042
display_minutes = 1042 // 60 
# // Redondeará hacia abajo ignorando los decimales
display_seconds = 1042 % 60
# Se hace uso del operador módulo (%) para obtener los segundos
# haciendo uso del residuo
print(str(display_minutes) + " minutes " + str(display_seconds) + " seconds") 

# Orden de las operaciones
# 1. Parentesis 
# 2. Exponentes
# 3. Multiplicación y división
# 4. Suma y resta
result_1 = 1032 + 26 * 2 
result_2 = 1032 + (26 * 2)
# Es mas legible la segunda linea ya que los parentesis la vulven mas comprensible.