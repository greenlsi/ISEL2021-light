

/* FSM inputs */
int button;
int deadline;

/* FSM outputs */
int light;


/*FSM behavior */
active proctype fsm() {
    int state = 0;

    printf("0\n");
    do
    :: (state == 0)->
        if
        :: (button)->light = 1; state = 1; button = 0; printf("Pasamos de 0 a 1\n");
        fi
:: (state == 1)->
        if
        :: (button)->button = 0;
        :: (deadline)->state = 0; deadline = 0; printf("Pasamos de 1 a 0\n");
    fi
od
}

