/* ISEL 2021 - light
*
* Modelo para verificacion formal. LTL
*
* @author: Javier Lopez Iniesta Diaz del Campo
* 
*/

/* property of turning on the light */
ltl turn_on {
    [] (button -> <> light)
}

/* property of turning off the light */
ltl turn_off {
    [] ((deadline && !button) -> !light)
}

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

    printf("Initial state: LIGHT_OFF \n");
    printf("state: %d, button: %d, deadline: %d, light: %d\n", state, button, deadline, light);

    do
    ::  if
        :: (state == LIGHT_OFF) -> atomic {
            if
            :: (button) -> light = 1; state = LIGHT_ON; button = 0; printf("(button) Transition from state LIGHT_OFF to state LIGHT_ON \n");
            fi;
        }
        :: (state == LIGHT_ON) -> atomic {
            if
            :: (button) -> state = LIGHT_ON; button = 0; printf("(button) Transition from state LIGHT_ON to state LED_ON \n");
            :: (deadline && !button) -> state = LIGHT_OFF; light = 0; printf("(deadline) Transition from state LIGHT_ON to state LIGHT_OFF \n");
            fi
        }
        fi;

        printf("state: %d, button: %d, deadline: %d, light: %d\n", state, button, deadline, light);
        
    od
}

/* environment*/
active proctype environment() {
    do
    :: !button -> skip
    :: button = 1
    :: deadline = 1
    od;
}