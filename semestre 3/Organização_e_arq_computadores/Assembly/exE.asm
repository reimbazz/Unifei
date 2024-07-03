.data
space: .asciiz " "  # espaço para separar os números

.text
.globl main

main:
    # leitura do inteiro N
    li $v0, 5        # codigo pra ler inteiro
    syscall
    move $t0, $v0    # t0 recebe N

contagem:
    bgtz $t0, imprimir   # se t0 é maior que 0 entra no loop
    j fim                # se t0 é 0 ou menor sai do loop

imprimir:
    move $a0, $t0    #move t0 para a0 para impressao
    li $v0, 1        # codigo para imprimir um inteiro
    syscall
    
    #imprime espaco
    li $t1, 1
    bgt $t0, $t1, print_space
    
    j decrementa

print_space:
    la $a0, space   #passa a string com espaco para a0 para impressao
    li $v0, 4       #codigo para imprimir inteiro
    syscall

decrementa:
    sub $t0, $t0, 1  #t0 -1
    j contagem       #retorna para o inicio do loop

fim:
    # Finaliza o programa
    li $v0, 10       # Código de serviço para sair do programa
    syscall          # Chama o sistema para encerrar o programa
