# Projektna naloga pri predmetu Programiranje 1

## Opis projekta
Ta projekt implementira preprosto igro **BlackJack** v jeziku OCaml kot **Moorejev končni avtomat**. V tem avtomatu so izhodi igre odvisni od trenutnih stanj, kar pomeni, da se igralcu prikazuje stanje igre, ki ustreza posamezni fazi igre.

## Tip avtomata
Projekt sledi zasnovi **Moorejevega avtomata**, kjer je izhod določen s trenutnim stanjem igre. Avtomat ima omejeno število stanj in prehodov med njimi, ki temeljijo na akcijah igralca (npr. stava, vlečenje nove karte, obstanek).

## Stanje avtomata
* **Začetno stanje (Stava)**: Igralec začne z začetnim denarjem (1000) in mora določiti stavo za posamezno igro.
*  **Stanje igranja**: Igralec izbere poteze: **"Hit"** (vleče novo karto in posodobi svojo vsoto), **"Stand"** (zaključi svojo potezo in preda igro dealerju).
* **Dealerjeva poteza**: Dealer vleče karte, dokler njegova vsota ni vsaj 17.
* **Končno stanje (Konec igre)**: Rezultat igre je določen: **Zmaga**: Igralec dobi dvojno vsoto stave, **Poraz**: Igralec izgubi stavo, **Neodločeno**: Igralcu se stava povrne.
* **Ponastavitev denarja**: Če igralec ostane brez denarja, dobi novo začetno vsoto 1000, s katero lahko nadaljuje igro.

## Prehodi med stanji
* **Stava** → **Igranje**: Po postavljeni stavi se igra začne.
* **Igranje** → **Dealerjeva poteza**: Ko igralec izbere "stand", poteza preide na dealerja.
* **Dealerjeva poteza** → **Konec igre**: Po dealerjevi potezi se razglasi rezultat igre.
* **Konec igre** → **Stava**: Igralec se lahko odloči za novo igro. Če ima 0 denarja, se stanje ponastavi na začetno vsoto.

## Navodila za zagon
Kompilirajte projekt s spodnjimi ukazi:
* ocamlc -c avtomat.mli
* ocamlc -c avtomat.ml
* ocamlc -c tekstovniVmesnik.mli
* ocamlc -c tekstovniVmesnik.ml
* ocamlc -o blackjack avtomat.cmo tekstovniVmesnik.cmo

Po kompilaciji zaženite igro s:
* ./blackjack

## Kako igrati
Če uporabnik ni seznanjen s pravili igranja BlackJacka si jih lahko prebere na povezavi: [BlackJack](https://en.wikipedia.org/wiki/Blackjack). Moja igra je poenostavljena. Igralec na začetku izbira koliko denarja bo stavil. Po izpisu svoje in dealerjeve vsote, se igralec odloči med "hit" in "stand". Če izbere "hit", vleče novo karto, katere vrednost se prišteje trenutni vsoti. Če izbere "stand", je na potezi dealer, ki vleče karte dokler njegova vsota ne znaša vsaj 17. Rezultat igre je odvisen od igralčeve in dealerjeve vsote (podrobneje si preberite pravila na zgornji povezavi). Naprej igralec ponovno sledi navodilom, ki se mu izpišejo.

## Avtor
**Enej Brus**
