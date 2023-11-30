%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx
pop edx
sub ecx,1
mov esi, 0
mov edi, 6 ; Заменили значение на 6
next:
cmp ecx, 0h
jz _end
pop eax
call atoi
mul edi ; Заменили на умножение на 6
add eax, 13 ; Добавили 13
add esi, eax
loop next
_end:
mov eax, msg
call sprint
mov eax, esi
call iprintLF
call quit