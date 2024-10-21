(* Funkcija za pridobitev vložka igralca *)
val ask_for_bet : Avtomat.state -> unit

(* Funkcija za prikaz začetnega stanja *)
val show_initial_state : Avtomat.state -> unit

(* Funkcija za igro igralca (hit ali stand) *)
val player_move : Avtomat.state -> unit


(* Funkcija za prikaz rezultata igre *)
val show_result : Avtomat.state -> unit

(* Funkcija za zagon igre *)
val play_game : unit -> unit
