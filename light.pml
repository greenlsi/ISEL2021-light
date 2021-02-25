/*  Modelo para verificacion formal, incluye especificacion LTL.
    ISEL 2021 */

/* FSM inputs (used for guards) */
int button;
int deadline;

/* FSM outputs */
int light;


/* Process that indicates FSM behavior */
active proctype fsm() {
    int state = 0;

    printf("0\n");
    do
    :: (state == 0)  ->
        if
        :: (button) -> light = 1; state = 1; button = 0; printf("Transition from state 0 to state 1\n");
        fi
    :: (state == 1) ->
        if
        :: (button) -> button = 0;
        :: (deadline && !button) -> state = 0; deadline = 0; printf("Transition from state 0 to state 1\n");
        fi
    od
}

/* Process that changes inputs arbitrarily  */

active proctype environment(){
    
}