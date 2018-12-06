; program that prints out a person's initials with colors on computer 
TITLE FinalProject
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096

.data
PersonName BYTE " Enter your name here:  ",0  ; name is BYTE that holds the following text followed by a person's name
space BYTE '  ', 0   ; This will be used to create the color 
color DWORD (brown+(brown*16)), (yellow+(yellow*16)), (lightBlue+(lightBlue*16)),(lightRed+(lightRed*16)), (lightMagenta+(lightMagenta*16)) ; Array of color i will use.. 

.code
;---------------------------------------letter Procedures--------------------------------------------
L_Letter PROC
; function for L initial
L_Letter ENDP


main PROC 
call clrscr
;--------------------------------this is where the user will put in their name----------------------------------
mov edx, OFFSET PersonName 
call WriteString
call ReadChar ; the name entered is now in edx
call WaitMsg
call Clrscr


;screen outputs the name entered 
;lea edx, PersonName
;push lenghtof name ; output the number of letters...?

;--------------------------------------------------------------------------------------------------------------



exit
main ENDP
END main

; reads a single character from standard input and returns in the AL register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;.data
;charIn BYTE ?

;.code
   ;   call ReadChar
     ; mov  charIn,al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
