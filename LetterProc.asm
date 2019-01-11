TITLE FinalProject 
Include Irvine32.inc
.data 
PersonName BYTE " Enter your name here:  ",0 
space BYTE " ",0
name1 BYTE 50 DUP(0),0
ErrorName BYTE " THIS IS NOT A LETTER !",0

.code

main PROC

call WaitMsg
call crlf
lea edx,PersonName                                   ;points to person name
call WriteString                                     ; " Enter your name here:  " will output
mov edx, OFFSET name1                                ; Address of where to store the name
mov ecx, 50                                          ; Max length of name
call ReadString                                      ; the user will be able to enter their name
call Clrscr                                          ; this clears teh screen by writing blanks on all posiions

; start looop here for each character user entered
mov al, name1                                        ; First letter of name is in al
cmp al, 'l'                                           ;compare if the first letter is l
    jne check_a                                       ; if the letter is not l, go to chek if it is another letter
    call L_proc                                       ; if it is l, go to l procedure 
    jmp END_CASE                                      ; else end the case 
check_a:
mov al, name1                                       
cmp al, 'a'
    jne check_b
    call A_proc
    jmp END_CASE
check_b:
mov al, name1
cmp al, 'b'
    jne check_c
    call B_proc
    jmp END_CASE
check_c:
mov al, name1
cmp al, 'c'
    jne check_d
    call C_proc
    jmp END_CASE
check_d:
mov al, name1
cmp al, 'd'
    jne check_e
    call D_proc
    jmp END_CASE
check_e:
mov al, name1
cmp al, 'e'
    jne check_f
    call E_proc
    jmp END_CASE
check_f:
mov al, name1
cmp al, 'f'
    jne check_t
    call F_proc
    jmp END_CASE
check_t:
mov al, name1
cmp al, 't'
    jne END_CASE
    call T_proc
    jmp END_CASE
END_CASE:
mov eax,black + (black* 16)                               ; this sets backround and the text color
call SetTextColor                                         ; call that puts the colors in 
call WaitMsg
ret
main ENDP

;-------------------------------------------------------A procedure------------------------------------------------
A_proc proc
; start the procedure for a letter 
push ecx                                                    ; this saves the loop counter 
mov ecx, 5                                                  ; this loop will run 5 times
HorizontalLoop5: 
        mov eax,lightRed + (lightRed* 16)                   ; this sets backround and the text color
        call SetTextColor                                   ; call that puts the colors in 
        mov edx,OFFSET space                                ; the address of space is in edx
        call WriteString                                    ;space outputs in color
    Loop HorizontalLoop5
    mov ecx,5                                               ; this loop will run 5 times
 VerticalLoop5: 
        mov eax,lightRed + (lightRed* 16)                   ;this sets the forground and backround colors
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
        call Crlf
        inc dl                                               ; this will increase the value of y until it gets to 5
    loop VerticalLoop5
mov ecx, 5
HorizontalLoop5_2: 
        mov eax,lightRed + (lightRed* 16)                      ; this sets backround and the text color
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop5_2
mov ecx, 5
 VerticalLoop5_2: 
        mov eax,lightRed + (lightRed* 16)                          ;this sets the forground and backround colors 
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
        call Crlf
        inc dl                                                     ; this will increase the value of y until it gets to 5
    loop VerticalLoop5_2
    mov ecx, 10                                                    ;loop counter
    mov dl, 5                                                      ; the colors will start being outbuted on 5 of the x axis
    mov dh,1                                                       ; the colors will start being outputed on 1 of the y axix 
    call gotoxy
 VerticalLoop5_3: 
        mov eax,lightRed + (lightRed* 16)                           ;this sets the forground and backround colors 
        call SetTextColor                                            
        mov ebx,edx                                                  ; i moved edx into ebx because i am already using dh and dl ( from edx) and i do not want to overwrite it 
        mov edx,OFFSET space
        call WriteString
        mov edx,ebx                                                  ; then I moved ebx back into edx
        inc dh                                                       ; this will increment dh until it gets to 10
     call gotoxy                                                                                             
    loop VerticalLoop5_3
    pop ecx
    ret

A_proc ENDP
;-------------------------------------------------------------------------------------------------------------------

;-----------------------------------------------B_Procedure--------------------------------------------------------------
B_proc proc
call Clrscr
push ecx
mov ecx, 5
HorizontalLoop6: 
        mov eax,white + (white* 16)                   
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop6
    mov ecx,10
 VerticalLoop6: 
        mov eax,white + (white* 16)                       
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
        call Crlf
        inc dl                                                  
    loop VerticalLoop6
mov ecx, 5
mov dl,1
mov dh, 5
call gotoxy
HorizontalLoop6_2: 
        mov eax,white + (white* 16)                        
        call SetTextColor
        mov ebx,edx                                                  
        call WriteString
        mov edx,ebx 
        inc dl
        call gotoxy
    Loop HorizontalLoop6_2
    mov ecx, 10                                                   
    mov dl, 5                                                      
    mov dh,1                                                       
    call gotoxy
 VerticalLoop6_3: 
        mov eax,white + (white* 16)                            
        call SetTextColor                                            
        mov ebx,edx                                                  
        call WriteString
        mov edx,ebx                                                  
        inc dh                                                       
     call gotoxy                                                                                             
    loop VerticalLoop6_3
    mov ecx, 5
    mov dl,1
    mov dh, 10
    call gotoxy
HorizontalLoop6_3: 
        mov eax,white + (white* 16)                        
        call SetTextColor
        mov ebx,edx                                                  
        call WriteString
        mov edx,ebx 
        inc dl
        call gotoxy
    Loop HorizontalLoop6_3
    pop ecx
    ret
B_proc ENDP
;-------------------------------------------------------------------------------------------------------------------------

;--------------------------------------------------------C_proc----------------------------------------------------------
C_proc proc
call Clrscr
push ecx
mov ecx, 7
HorizontalLoop7: 
        mov eax,brown + (brown* 16)                   
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop7                                            
 mov ecx ,10                                      
        VerticalLoop7: 
            mov eax,brown + (brown* 16)                   
            call SetTextColor
            mov edx,OFFSET space                          
            call WriteString
            call Crlf
            inc dl                                     
        loop VerticalLoop7
        mov ecx, 9
        HorizontalLoop7_2: 
            mov eax,brown + (brown* 16)                    
            call SetTextColor
            mov edx,OFFSET space
            call WriteString
        Loop HorizontalLoop7_2
    pop ecx
    call crlf
    ret
C_proc ENDP
;--------------------------------------------------------------------------------------------------------------

;------------------------------------------------------D procedure -------------------------------------------
D_proc proc


D_proc ENDP
;-----------------------------------------------------------------------------------------------------------

;-----------------------------------------------L procedure----------------------------------------------------------
L_proc proc
    call Clrscr                                             
    push ecx
        mov ecx ,12                                      
        VerticalLoop1: 
            mov eax,white + (white* 16)                   
            call SetTextColor
            mov edx,OFFSET space                          
            call WriteString
            call Crlf
            inc dl                                     
        loop VerticalLoop1

        mov ecx, 10
        HorizontalLoop1: 
            mov eax,white + (white* 16)                    
            call SetTextColor
            mov edx,OFFSET space
            call WriteString
        Loop HorizontalLoop1
    pop ecx
	call crlf
    ret
L_proc ENDP 
;--------------------------------------------------------------------------------------------------

;-----------------------------------------------E procedure---------------------------------------
E_proc proc
push ecx
     mov ecx, 10
    HorizontalLoop2: 
        mov eax,magenta + (magenta* 16)
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop2

    mov ecx,7
 VerticalLoop2: 
        mov eax,magenta + (magenta* 16) 
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
        call Crlf
        inc dl                                         
    loop VerticalLoop2

  mov ecx, 10
 HorizontalLoop2_2: 
        mov eax,magenta + (magenta* 16)
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop2_2

    mov ecx,7
 VerticalLoop2_2: 
        mov eax,magenta + (magenta* 16) 
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
        call Crlf
        inc dl                                           
    loop VerticalLoop2_2
 mov ecx, 10
 HorizontalLoop2_3: 
        mov eax,magenta + (magenta* 16)
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop2_3
pop ecx
	call crlf                                              
    ret
E_proc ENDP  
;-----------------------------------------------------------F procedure-----------------------------------
F_proc proc
push ecx
mov ecx, 7
HorizontalLoop3: 
        mov eax,yellow + (yellow* 16)                  
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop3
mov ecx,5
 VerticalLoop3: 
        mov eax,yellow + (yellow* 16) 
        call SetTextColor
        mov edx,OFFSET space 
        call WriteString
        call Crlf
        inc dl                                         
    loop VerticalLoop3
    mov ecx, 5
HorizontalLoop3_2: 
        mov eax,yellow + (yellow* 16)                  
        call SetTextColor
        mov edx,OFFSET space
        call WriteString
    Loop HorizontalLoop3_2
mov ecx,5
 VerticalLoop3_2: 
        mov eax,yellow + (yellow* 16)                   
        call SetTextColor
        mov edx,OFFSET space 
        call WriteString
        call Crlf
        inc dl                                          
    loop VerticalLoop3_2
    pop ecx
	call crlf                                           
    ret
F_proc ENDP
;----------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------T procedure-------------------------------------
T_proc proc
push ecx
mov ecx, 5
mov dh,1
mov dl,1
call  gotoxy
HorizontalLoop4: 
        mov eax,lightGreen + (lightGreen* 16)                  
        call SetTextColor
        mov ebx,edx
        mov edx,OFFSET space
        call WriteString
        mov edx, ebx
        inc dl
        call gotoxy
    Loop HorizontalLoop4
mov ecx, 10
    mov dl, 5
    mov dh, 1
    call gotoxy
VerticalLoop4:
        mov eax,lightGreen + (lightGreen* 16)
        call SetTextColor
        mov ebx,edx                                                 
        mov edx,OFFSET space
        call WriteString
        mov edx,ebx                                       
        inc dh
        call gotoxy
     loop VerticalLoop4
     mov ecx, 5
     mov dh,1
     mov dl,5
     call gotoxy
HorizontalLoop4_2: 
        mov eax,lightGreen + (lightGreen* 16)                   
        call SetTextColor
        mov ebx,edx                                                   
        mov edx,OFFSET space
        call WriteString
        mov edx,ebx  
        inc dl
        call gotoxy
    Loop HorizontalLoop4_2
    pop ecx
    call crlf
     ret
T_proc ENDP
;------------------------------------------------------------------------------------------------------------

END


;not working : B
;working : A, F, E, L, C
;ALMOST THERE : T 

