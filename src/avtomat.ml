(* Definicija stanja igre *)
type state = {
  mutable player_money: int;
  mutable player_sum: int;
  mutable dealer_sum: int;
  mutable player_bet: int;
}

(* Inicializacija stanja igre *)
let init_state () = {
  player_money = 1000;
  player_sum = 0;
  dealer_sum = 0;
  player_bet = 0;
}

(* Funkcija za generiranje naključne karte (od 1 do 11) *)
let draw_card () = 
  Random.self_init ();
  Random.int 11 + 1

(* Funkcija za preverjanje, če je igralec ali dealer presegel 21 *)
let is_bust sum = 
  sum > 21

(* Funkcija za preverjanje zmage *)
let check_winner st =
  if st.player_sum = 21 then
    "Igralec ima BlackJack! Zmaga!"
  else if st.dealer_sum = 21 then
    "Dealer ima BlackJack! Dealer zmaga!"
  else if is_bust st.player_sum then
    "Igralec ima več kot 21! Izpad!"
  else if is_bust st.dealer_sum then
    "Dealer ima več kot 21! Igralec zmaga!"
  else if st.player_sum > st.dealer_sum then
    "Igralec zmaga!"
  else if st.dealer_sum > st.player_sum then
    "Dealer zmaga!"
  else
    "Neodločeno!"

(* Funkcija za posodobitev stanja stav *)
let place_bet st bet_amount =
  if bet_amount > st.player_money then
    failwith "Stava presega razpoložljiv denar!"
  else
    st.player_bet <- bet_amount;
    st.player_money <- st.player_money - bet_amount

(* Funkcija za dealerjevo potezo *)
let dealer_turn st =
  while st.dealer_sum < 17 do
    let card = draw_card () in
    st.dealer_sum <- st.dealer_sum + card;
  done

(* Funkcija za igro igralca *)
let player_turn st =
  let card = draw_card () in
  st.player_sum <- st.player_sum + card

