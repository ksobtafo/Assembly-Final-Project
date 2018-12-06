Include Irvine32.inc
.data 
space BYTE " ",0
.code
main proc
;----------------------------------------L procedure-----------------------------------

mov ecx, 15 ; this sets the loop counter for the vertical colors
mov dl,1 ; the colors will start to be outputed along the y axis starting from 1

;this is the operation that will make the space have a the color blue 
mov eax,blue + (blue* 16) 
call SetTextColor
mov edx,OFFSET space
call WriteString
call Crlf

inc dl ; this will increase the value of y until it gets to 15
    HorizontalLoop: 
        push ecx ; this saves the loop counter for the horizontal colors 
        mov ecx,10
            VerticalLoop: 
            mov dl, 15 ; start from this...i hope
            mov dh, 1  ;the colors will start to be outputed along the x axis starting from (15,1)
 
           ;this is the operation that will make the letter colored 
            mov eax,blue + (blue* 16)
            call SetTextColor
            mov edx,OFFSET space
            call WriteString
            call Crlf

            inc dh ;this will increase the value of x until it gets to 10
            Loop VerticalLoop
            pop ecx ; this restore outer loop count
    Loop HorizontalLoop
exit
main ENDP
END
; problem: hoizointal loop is making column on all the vertical parts 
;pronlem: now it starts form 10 i think...
