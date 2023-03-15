text = """Interesting facts about the Moon. The Moon is Earth's only satellite. There are several interesting facts about the Moon and how it affects life here on Earth. On average, the Moon moves 4cm away from the Earth every year. This yearly drift is not significant enough to cause immediate effects on Earth. The highest daylight temperature of the Moon is 127 C."""

# Separar Frases
sentences = text.split('. ')
print(sentences)

# Encontrar palabra en cada frase
for sentence in sentences:
    if 'temperature' in sentence:
        print(sentence)