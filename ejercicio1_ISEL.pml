//Ejercicio control de una luz con pulsadores inalámbricos
//máquina de estados

int boton;
int luz;
int deadline;

active proctype fsm()
{
    int state=0;

    do
        :: (state==0)->
            if
                ::(boton)-> luz=1; state=1; boton=0;deadline=30;printf("se enciende luz\n");
            fi
        ::(state==1)->
            if
                ::(boton)-> boton=0;deadline=30;
                ::((boton==0)&&(deadline!=0))-> deadline=deadline-1;printf("segundos restantes=%d\n",deadline);
                ::(deadline==0)-> state=0;deadline=0;printf("se apaga luz\n");
            fi
    od
}