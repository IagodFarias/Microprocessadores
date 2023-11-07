;utilizando os pinos da portA para sa�da  
#include<p16f628a.inc>

ORG 0x00
GOTO START
ORG 0x04
RETFIE
        
START    
BANKSEL CMCON	;DESABILITADO O M�DULO COMPARADOR
movlw 0x07
movwf CMCON 
BANKSEL TRISA	;COLOCANDO OS PINOS <0,7> DO PORTA A COMO S�IDA
movlw	0x00
movwf	TRISA
movlw	0xFF	;COLOCANDO OS PINOS <0.7> DA PORTA B COMO ENTRADA
MOVWF	TRISB

BANKSEL PORTA  ; SETANDO OS N�VEIS DA PORTA A COM 5V 
movlw 0x00
movwf	PORTA

BCF PORTB, 4 ; GARANTE QUE A LEITURA INICIAL DO BOT�O SEJA SEMPRE ZERO


BUTTON
BTFSS	PORTB, 4
GOTO OFF
GOTO ON

ON
MOVLW 0XFF
MOVWF TRISA
GOTO BUTTON

OFF
MOVLW 0X00
MOVWF TRISA
GOTO BUTTON
    
    
END


