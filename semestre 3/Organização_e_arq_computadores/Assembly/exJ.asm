.data
array: .space 24  # Espaço para 6 inteiros (6 * 4 bytes)
count: .word 6    # Número de valores a serem lidos

.text
.globl main

# Função principal
main:
	# Chama o subprograma para ler os valores e armazená-los no array
	jal read_values

   	# Chama o subprograma para encontrar o maior valor
   	jal find_max

    	# Imprime o maior valor
    	move $a0, $v0        # O maior valor está em $v0
	li $v0, 1            # Código do syscall para print_int
	syscall

	# Finaliza o programa
	li $v0, 10           # Código do syscall para exit
	syscall

# Subprograma para ler valores e armazenar no array
read_values:
	la $t0, array       # Carrega o endereço base do array em $t0
	li $t1, 0            # Inicializa o índice a 0

read_loop:
	li $v0, 5            # Código do syscall para read_int
	syscall
	sw $v0, 0($t0)       # Armazena o valor lido no array

	addi $t0, $t0, 4     # Avança para a próxima posição no array
	addi $t1, $t1, 1     # Incrementa o índice
	li $t2, 6            # Número de valores a serem lidos
	blt $t1, $t2, read_loop # Repete o loop se ainda não tiver lido 6 valores

	jr $ra               # Retorna ao chamador

# Subprograma para encontrar o maior valor no array
find_max:
	la $t0, array        # Carrega o endereço base do array em $t0
	lw $t1, 0($t0)       # Carrega o primeiro valor do array em $t1 (maior valor inicial)
	li $t2, 1            # Inicializa o índice a 1

find_max_loop:
	lw $t3, 4($t0)       # Carrega o próximo valor do array em $t3
	blt $t3, $t1, skip   # Se $t3 < $t1, pula a atualização do maior valor
	move $t1, $t3        # Atualiza o maior valor para $t3

skip:
	addi $t0, $t0, 4     # Avança para a próxima posição no array
	addi $t2, $t2, 1     # Incrementa o índice
	li $t4, 6            # Número de valores no array
	blt $t2, $t4, find_max_loop # Repete o loop se ainda não tiver verificado todos os valores

	move $v0, $t1        # Armazena o maior valor em $v0 para retorno

	jr $ra               # Retorna ao chamador
