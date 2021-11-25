section .text
extern main
global sorting

sorting:
    enter 0, 0
    mov edx, [ebp + 8]   ;vetor
    mov ecx, [ebp + 12]  ;tamanho
    dec ecx
    push ebx
    mov ebx, 0
    mov eax, 0

loop1:
    mov ebx,0                       ; colocando o indice em 0

loop2:
    push eax                        ;guardar na pilha os valores para poder usar os registradores na comparacao
    push ecx
    mov eax, [edx + ebx*4]
    mov ecx, [edx + ebx*4 + 4]

    cmp ecx, eax
    jle update_inloop                 
    
    mov [edx + ebx*4], eax
    mov [edx + ebx*4 + 4], ecx


update_inloop:
    pop ecx                         ; retornar os valores da pilha, contador e indice do loop de fora
    pop eax

    inc ebx                         ;atualizando o indice, j++
    cmp ebx, ecx                    ;fazendo a checagem do loop, j < tamanho do array -1 ?
    jne loop2
    jmp update_outloop

update_outloop:
    inc eax                         ;atualizando o indice, i++

    cmp eax, ecx                    ;fazendo a checagem do loop, i < tamanho do array -1 ?
    jne loop1


end:
    inc ecx                         ; restaurando o tamanho do vetor para devolver o valor certo para o codigo em C
    pop ebx                         ; trazendo o valor de ebx guardado no comeco
    
    push ecx                        ; devolvendo os valores para o codigo em C para printar
    push eax                            

    leave                           ;destruindo stack frame
    ret


