(* Definicija stanja igre *)
type state = {
  mutable player_money: int;
  mutable player_sum: int;
  mutable dealer_sum: int;
  mutable player_bet: int;
}

(* Funkcija za inicializacijo začetnega stanja *)
val init_state : unit -> state

(* Funkcija za generiranje naključne karte *)
val draw_card : unit -> int

(* Funkcija za preverjanje, če je vsota večja od 21 (izpad) *)
val is_bust : int -> bool

(* Funkcija za preverjanje zmagovalca *)
val check_winner : state -> string

(* Funkcija za postavitev stave *)
val place_bet : state -> int -> unit

(* Dealerjeva poteza *)
val dealer_turn : state -> unit

(* Poteza igralca *)
val player_turn : state -> unit
