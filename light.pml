int boton;
int luz;
int deadline;

active proctype fsm()
{
    int state = 0;

    do
    :: (state == 0) ->
        if
        :: (boton) -> luz = 1; state = 1; boton = 0;
        fi
    :: (state == 1) ->
        if
        :: (boton) -> boton = 0;
        :: (deadline) -> state = 0; deadline = 0;
        fi
    od

}