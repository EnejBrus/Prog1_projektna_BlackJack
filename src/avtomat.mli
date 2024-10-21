(* Definicija stanja igre *)
type state = {
  mutable player_money: int;
  mutable player_sum: int;
  mutable dealer_sum: int;
  mutable player_bet: int;
}

(* Inicializacija začetnega stanja igre *)
val init_state : unit -> state

(* Funkcija za generiranje naključne karte *)
val draw_card : unit -> int

(* Funkcija za preverjanje, ali je igralec/dealer presegel 21 (izpad) *)
val is_bust : int -> bool

(* Funkcija za preverjanje zmagovalca in vrnitev rezultata *)
val check_winner : state -> string

(* Funkcija za postavitev stave (preveri, če je stava dovoljena) *)
val place_bet : state -> int -> unit

(* Dealerjeva poteza, kjer dealer vleče karte, dokler ne doseže vsaj 17 *)
val dealer_turn : state -> unit



(* Funkcija za izplačilo ob zmagi, ki ustrezno posodobi denar igralca *)
val payout : state -> string -> unit
