; GERAR UM SINAL DE PWM NO PINO RB3 DE 20KHZ E DUTY CICLE DE 25%
; FINT = 4MHZ
    
    
    
#INCLUDE<P16F628A.INC>
    ORG 0X00
    GOTO START
    ORG 0X04
    RETFIE
    
    
    START
    ;DEFINIR PINOS RB<3> COMO OUT
    BANKSEL	TRISB
    CLRF	TRISB
    ;CONFIGURAR TIMER2
    BANKSEL	TMR2
    MOVLW	B'00000100'
    MOVWF	T2CON
    ;CONFIGURAR MODO PWM
    BANKSEL CCP1CON
    MOVLW   B'00001100'
    MOVWF   CCP1CON
    MOVLW   B'00001100'
    MOVWF   CCPR1L
  
    END

