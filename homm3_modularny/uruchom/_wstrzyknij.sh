#!/bin/bash
# Uruchamiane WEWNATRZ kontenera, jako punkt wejscia, gdy sterownik jest
# wstrzykiwany recznie. Nie uruchamiaj tego na hoscie.
#
# PO CO TO ISTNIEJE
# -----------------
# Srodowisko uruchomieniowe NVIDII, montujac biblioteki sterownika, robi
# jeszcze dwie rzeczy, o ktorych latwo zapomniec: DOPISUJE sie do sciezki
# poszukiwania bibliotek i odswieza spis bibliotek w kontenerze. Pominiecie
# tego drugiego konczy sie tym, ze wstrzykniete biblioteki sa na miejscu,
# ale nikt ich nie znajduje.
#
# Pierwsza wersja tego obejscia przekazywala LD_LIBRARY_PATH zmienna
# srodowiskowa dockera, czyli NADPISYWALA to, co ustawia obraz. Skutek byl
# taki, ze wtyczka CUDA w JAX-ie nie znalazla libcusparse, zglosila blad
# i JAX po cichu przeszedl na procesor - a pomiar wygladal na udany.
# Dlatego teraz dopisujemy sie do istniejacej wartosci, a nie zastepujemy jej.
set -u

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# Odswiezenie spisu bibliotek: wstrzyknelismy pliki do /usr/lib/x86_64-linux-gnu,
# ale spis w obrazie powstal, kiedy ich tam nie bylo. Bez tego dlopen moze ich
# nie zobaczyc. Dziala bez roota, bo w kontenerze jestesmy rootem.
ldconfig 2>/dev/null || true

exec "$@"
