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

# ODDANIE PLIKOW WLASCICIELOWI KATALOGU.
#
# W kontenerze jestesmy rootem, wiec wszystko, co tu powstanie w zamontowanym
# katalogu, nalezy na hoscie do roota - i uzytkownik nie moze potem nawet
# usunac wlasnych wynikow ("Permission denied" na rm). Obejscie przez
# uruchamianie kontenera jako --user nie przechodzi, bo ncu potrzebuje
# uprawnien, ktore z tym nie wspolgraja.
#
# Wiec zamiast tego: policz, co trzeba, a na wyjsciu oddaj pliki. Kod wyjscia
# komendy musi przezyc, bo kolejka na nim polega przy ocenie etapu.
if [[ -n "${HOST_UID:-}" && -n "${HOST_GID:-}" ]]; then
  "$@"
  KOD=$?
  for KAT in wyniki wyniki_* rysunki tabele; do
    [[ -e "$KAT" ]] && chown -R "$HOST_UID:$HOST_GID" "$KAT" 2>/dev/null || true
  done
  exit $KOD
fi

exec "$@"
