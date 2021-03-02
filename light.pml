/* Modelo para verificacion formal. LTL
*
* Javier Lopez Iniesta Diaz del Campo
* 
* ISEL 2021
*
*/

/* inputs */
int deadline;
int button;

/* output */
int light;

/* states */
mtype = {LIGHT_ON, LIGHT_OFF};
byte state;

active proctype light_fsm() {
    state = LIGHT_OFF;
    do
    :: (state == LIGHT_OFF) -> atomic {
        if
        :: (button) -> light = 1; state = LIGHT_ON; button = 0; printf(''Transicion de LIGHT_OFF a LIGHT_ON \n")
        fi;
    }
    :: (state == LIGHT_ON) -> atomic {
        if
        :: (button) -> state = LIGHT_ON; button = 0; printf(''Transicion de LIGHT_ON a LED_ON \n")
        :: (timeout && !button) -> state = LIGHT_OFF; light = 0; printf(''Transicion de LIGHT_ON a LIGHT_OFF \n")
        fi;
    }
    od
}

active proctype environment() {
    do
        if
        :: button = 1;
        :: (!button) -> skip;
        fi
    od;
}