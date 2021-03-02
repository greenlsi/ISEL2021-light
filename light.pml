/*  Modelo para verificacion formal, incluye especificacion LTL.
    ISEL 2021 */

/* FSM inputs (used for guards) */
int button;
int deadline = 1; // not exactly an input

/* FSM outputs */
int light;


/* Process that indicates FSM behavior */
active proctype fsm() {
    int state = 0;

    printf("0\n");
    do
    :: (state == 0)  -> atomic {
        if
        :: (button) -> light = 1; state = 1; button = 0; printf("Transition from state 0 to state 1\n");
        fi
    }
    :: (state == 1) -> atomic {
        if
        :: (button) -> button = 0; printf("Transition from state 1 to state 1\n");
        :: (deadline && !button) -> state = 0; light = 0; printf("Transition from state 1 to state 0\n");
        fi
    }
    od
}

/* Process that changes inputs arbitrarily  */

active proctype environment(){
    do
    ::  if
        :: button = 1;
        :: skip;
        fi
    od
}