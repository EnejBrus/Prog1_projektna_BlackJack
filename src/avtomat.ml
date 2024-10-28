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

(* Funkcija za ponastavitev denarja, ko igralec ostane brez njega *)
let reset_money st =
  st.player_money <- 1000;
  Printf.printf "Zmanjkalo vam je denarja. Začenjate znova z %d denarja.\n" st.player_money

(* Funkcija za generiranje naključne karte (od 1 do 11) *)
let draw_card () = 
  Random.self_init ();
  Random.int 11 + 1

(* Funkcija za preverjanje, če je vsota večja od 21 (izpad) *)
let is_bust sum = 
  sum > 21

(* Funkcija za preverjanje zmagovalca in vrnitev rezultata *)
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

(* Funkcija za postavitev stave (preveri, če je stava dovoljena) *)
let place_bet st bet_amount =
  if bet_amount > st.player_money then
    failwith "Stava presega razpoložljiv denar!"
  else
    st.player_bet <- bet_amount;
    st.player_money <- st.player_money - bet_amount

(* Dealerjeva poteza, kjer dealer vleče karte, dokler ne doseže vsaj 17 *)
let dealer_turn st =
  while st.dealer_sum < 17 do
    let card = draw_card () in
    st.dealer_sum <- st.dealer_sum + card;
    Printf.printf "Dealer potegne karto: %d (vsota dealerja: %d)\n" card st.dealer_sum
  done

(* Funkcija za igralčevo potezo "hit" *)
let hit st =
  let card = draw_card () in
  st.player_sum <- st.player_sum + card;
  Printf.printf "Potegnil si karto: %d (nova vsota igralca: %d)\n" card st.player_sum

(* Funkcija za potezo "stand" *)
let stand st =
  Printf.printf "Obstaneš z vsoto: %d\n" st.player_sum;
  dealer_turn st

(* Funkcija za izplačilo ob zmagi *)
let payout st result =
  match result with
  | "Igralec zmaga!" | "Igralec ima BlackJack! Zmaga!" | "Dealer ima več kot 21! Igralec zmaga!" ->
      let winnings = st.player_bet * 2 in
      st.player_money <- st.player_money + winnings;
      Printf.printf "Čestitamo! Zmagali ste %d in zdaj imate %d denarja.\n"
        winnings st.player_money
  | "Neodločeno!" ->
      st.player_money <- st.player_money + st.player_bet;  (* Vračamo stavo *)
      Printf.printf "Neodločeno! Stava %d je vrnjena. Zdaj imate %d denarja.\n"
        st.player_bet st.player_money
  | _ ->
      Printf.printf "Izgubili ste stavo. Trenutno stanje denarja: %d\n" st.player_money
