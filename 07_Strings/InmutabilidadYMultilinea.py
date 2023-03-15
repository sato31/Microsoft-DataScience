# INMUTABILIDAD
fact = "The Moon has no atmosphere."
print( fact + "No sound can be heard on the Moon.")
print(fact)

two_facts = fact + "No sound can be heard on the Moon."
print(two_facts)

# En Python es posible usar comillas simples, doble o triples
# Se recomienda alternar el uso de las comillas 
# para evitar errores como el siguiente:
#
# >>> 'We only see about 60% of the Moon's surface'
#  File "<stdin>", line 1
#    'We only see about 60% of the Moon's surface'
#                                       ^
# SyntaxError: invalid syntax
#

# TEXTO MULTILINEA
# Para defeinir varias lineas de texto en una sola variable se puede usar:
# - Caracter de nueva linea (\n)
# - Comillas Triples (""")
#
multiline = "Facts about the Moon: \n There is no atmosphere.\n There is no a sound."
print(multiline)

multiline = """Facts about the Moon:
 There is no atmosphere.
 There is no a sound."""
print(multiline)
