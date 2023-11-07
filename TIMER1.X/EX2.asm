
;TEMPORIZAÇÃO COM TIMER1 - CLOCK INTERNO DE 4MHZ - FAÇA O PINO RB0 GERAR UMA SAÍDA DE 2HZ    
#INCLUDE<P16F628A.INC>
    org 0x00
    CONTA EQU 0X20
    goto START
    org 0x04
    bcf PIR1,0
    DECFSZ  CONTA,F
    RETFIE
    MOVLW   0X0B
    MOVWF   TMR1H
    MOVLW   0XDC
    MOVWF   TMR1L
    movlw   B'10000000';CRIAR UMA MASCARA PARA TROCAR O VALOR DE portB
    xorwf   PORTB,F
    retfie
    
   
 
    START
    BANKSEL PIE1
    ;habilita interrupção geral e de periférico
    movlw   B'11000000'
    movwf   INTCON
    ;habilita interrupção individual do timer1
    movlw   B'00000001'
    movlw   PIE1
     ;configura I/0 para a portb rb<0,7> como output E GARANTO QUE NO INÍCIO ESTÁ RESETADAS
    CLRF   TRISB
    
    BANKSEL T1CON
   
    ;configura o timer1 para: clk interno, sincronizado com prescale 1:8 e ativa a contagem do timer1
    movlw   B'00110101'
    movwf   T1CON
    MOVLW   0X0B
    MOVWF   TMR1H
    MOVLW   0XDC
    MOVWF   TMR1L
    MOVLW   D'2'
    MOVWF   CONTA
    FIM	    
    goto FIM
    
    END


