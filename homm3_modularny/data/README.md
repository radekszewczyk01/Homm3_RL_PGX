# data/

Tu wrzuc `homm3_static_lut.npy` ze starego repozytorium.

Bez tego pliku silnik uzyje puli awaryjnej wpisanej na sztywno w
`homm3/rdzen.py` (dwanascie stworow). Wszystko bedzie dzialac, ale liczby
NIE BEDA porownywalne z praca magisterska ani z poprzednimi pomiarami,
bo pula sie rozni - a to zmienia i czestosc mechanik, i dlugosc bitew.

Skrypt `eksperymenty.py zgodnosc` sprawdza tylko rozmiar stanu i przestrzen
akcji, ktore od puli nie zaleza, wiec przejdzie i bez tego pliku. Zadbaj
o niego sam.
