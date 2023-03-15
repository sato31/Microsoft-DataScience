# ELSE
a = 93
b = 27
if a <= b:
    print(a)
else:
    print(b)

#ELIF
a = 5
b = 5
if a > b:
    print("a is greater than or equal to b")
elif a == b:
    print("a is equal to b")

# Combinacion de Condicionales
a = 93
b = 27
if a > b:
    print("a is greater than b")
elif a < b:
    print("a is less than b")
else:
    print("a is equal to b")

# Condicionales Anidados
a = 16
b = 25
c = 27
if a > b:
    if b > c:
        print("a is greater than b and b is greater than c")
    else: 
        print("a is greater than b and less than c")
elif a == b:
    print("a is equal to b")
else: 
    print("a is less than b")
