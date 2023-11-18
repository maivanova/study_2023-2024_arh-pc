;--------------------------------
; Программа вычисления выражения
;--------------------------------
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
v: DB '(5 + х)^2 - 3',0
x: DB 'Введите значение х: ',0
div: DB 'Результат: ',0
SECTION .bss ; Секция не инициированных данных
buf1: RESB 80 ; Буфер размером 80 байт
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax, v
call sprintLF

mov eax, x
call sprint
             
mov eax, 3 ; Системный вызов для чтения (sys_read)
mov ebx, 0 ; Дескриптор файла 0 - стандартный ввод
mov ecx, buf1 ; Адрес буфера под вводимую строку
mov edx, 80 ; Длина вводимой строки
int 80h ; Вызов ядра

mov eax, buf1
call atoi 

add eax,5
mul eax
add eax, -3
mov edx, eax
mov eax, div 
call sprint 
mov eax, edx 
call iprintLF  

  
call quit ; вызов подпрограммы завершения