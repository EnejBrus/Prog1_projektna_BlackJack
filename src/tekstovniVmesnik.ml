(* Uvozimo funkcije iz game.ml *)
open Avtomat

(* Funkcija za pridobitev vložka igralca *)
let rec ask_for_bet st =
  Printf.printf "Koliko denarja želiš vložiti? (Imaš %d denarja): " st.player_money;
  try
    let bet = int_of_string (read_line ()) in
    if bet > st.player_money then (
      Printf.printf "Ne moreš staviti več denarja, kot ga imaš!\n";
      ask_for_bet st
    ) else
      place_bet st bet;
      Printf.printf "Stavil si %d. Preostanek denarja: %d\n" st.player_bet st.player_money
  with
    Failure _ -> 
      Printf.printf "Prosim vnesi veljavno številko.\n";
      ask_for_bet st

(* Funkcija za prikaz začetnega stanja *)
let show_initial_state st =
  st.player_sum <- draw_card () + draw_card ();
  st.dealer_sum <- draw_card ();
  Printf.printf "Tvoje karte: %d, Dealerjeva prva karta: %d\n" st.player_sum st.dealer_sum

(* Funkcija za igro igralca *)
let rec player_move st =
  Printf.printf "\nIzberi potezo: (h)it ali (s)tand: ";
  let choice = read_line () in
  match choice with
  | "h" -> 
      player_turn st;
      Printf.printf "Nova vsota igralca: %d\n" st.player_sum;
      if is_bust st.player_sum then
        Printf.printf "Presegel si 21! Izpad!\n"
      else
        player_move st  (* Ponovno vprašanje za potezo *)
  | "s" -> 
      Printf.printf "Obstaneš z vsoto: %d\n" st.player_sum;
      dealer_turn st  (* Zdaj igra dealer *)
  | _ -> 
      Printf.printf "Napačna izbira! Izberi ponovno.\n";
      player_move st

(* Funkcija za prikaz rezultata *)
let show_result st =
  let result = check_winner st in
  Printf.printf "Rezultat: %s\n" result

(* Funkcija za zagon igre *)
let play_game () =
  let st = init_state () in
  ask_for_bet st;
  show_initial_state st;
  player_move st;
  show_result st

;;

