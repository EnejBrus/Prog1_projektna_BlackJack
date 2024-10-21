(* Funkcija za pridobitev vložka igralca *)
val ask_for_bet : Game.state -> unit

(* Funkcija za prikaz začetnega stanja *)
val show_initial_state : Game.state -> unit

(* Funkcija za igro igralca (hit ali stand) *)
val player_move : Game.state -> unit

(* Funkcija za prikaz rezultata igre *)
val show_result : Game.state -> unit

(* Funkcija za zagon igre *)
val play_game : unit -> unit
