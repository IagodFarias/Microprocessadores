#include<p16f628a.inc>
org 0x00
goto start
org 0x04
retfie

start
banksel	    TRISA	;definindo Porta A<1,2> Com Input e PORTA B<0,7> como OUT
movlw	    0x06	; 0000 0110
movwf	    TRISA	
movlw	    0x00	 ; 0000 0000
movwf	    TRISB      
banksel	    PORTA	;desabilitando o módulo comparador 
movlw	    0x07	
movwf	    CMCON	

bcf PORTA,2 ;garanto que a entrada está zerada no start
bcf PORTA,1 ; garanto que a entrada esta zerada no start    

button	    
btfss	    PORTA,1
goto	    class0	    
goto	    class1    
    
class1    
btfss	    PORTA,2
goto	    number2
goto	    number3
    
class0
btfss	    PORTA,2
goto	    number0
goto	    number1

number0
movlw	    0x3F	; 0011	1111
movWF	    TRISB
goto	    button    

number1
movlw	    0x06	; 0000 0110  
movwf	    TRISB
GOTO	    button

number2
movlw	    0x5B	; 0101 1101
movwf	    TRISB
GOTO	    button

number3
movlw	    0x4F	; 0100 1111 
movwf	    TRISB
GOTO	    button
    
end


