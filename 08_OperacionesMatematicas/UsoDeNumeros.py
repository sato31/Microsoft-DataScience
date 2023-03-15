# Conversión de Cadenas en números
demo_int = int('215')   # Convierte a entero
print(demo_int)

demo_float = float('215.3') # Convierte a flotante
print(demo_float)

# Valores absolutos
print(abs(39 - 16))
print(abs(16 - 39))

# Redondeo
# Redondea hacia arriba si el decimal es mayor a .5,
# redondea hacia abajo si el decimal es menor o igual que .5
print(round(14.51))
print(round(14.5))
print(round(14.49))

# Redondeo usando la biblioteca matemática
from math import ceil, floor

round_up = ceil(12.5) # ceil para redondear hacia arriba
print(round_up)

round_down = floor(12.5) # floor para redondear hacia abajo
print(round_down)