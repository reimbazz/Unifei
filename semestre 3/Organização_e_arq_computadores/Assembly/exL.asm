.data
	arrayA: .space 16  # Espaço para x inteiros (x * 4 bytes)
	arrayB: .space 24   
.text
.globl main
main:
	jal lerA
	
	jal lerB
	
	jal compara_a_b
	
	li $v0, 1
	syscall
	
	# Finaliza o programa
   	 li $v0, 10         # Código de serviço para sair do programa
   	 syscall            # Chama o sistema para encerrar o programa
   	 
   	 
lerA:
	la $t0, arrayA #t0 = []
	li $t1, 0  # i = 1
lerA_loop:
	li $v0, 5
	syscall
	sw $v0, 0($t0)  # Armazena o valor lido em arrayA
	addi $t0, $t0, 4     # Avança para a próxima posição no array
	addi $t1, $t1, 1 # i += 1
	li $t2, 4
	blt $t1, $t2, lerA_loop
	
	jr $ra

lerB:
	la $t3, arrayB #t0 = []
	li $t1, 0  # i = 0
lerB_loop:
	li $v0, 5
	syscall
	sw $v0, 0($t3)  # Armazena o valor lido em arrayB
	addi $t3, $t3, 4     # Avança para a próxima posição no array
	addi $t1, $t1, 1 # i += 1
	li $t2, 6
	blt $t1, $t2, lerB_loop
	
	jr $ra
	
	
compara_a_b:

	li $t4, 0 #count = 0
	la $t5, arrayA #carrega a lista A
	li $t6, 4 #elementos em A
	
	#for dentro de for
loop_externo:
	beqz $t6, fim_externo #quando t6 = 0 acabou
	lw $t7, 0($t5) #elemento atual de A
	la $t8, arrayB #endereço de B
	li $t9, 6 #quantidade de elementos em B

loop_interno:
	beqz $t9, fim_interno #quando t9 = 0 acabou
	lw $t0, 0($t8)  # Carrega o elemento atual de arrayB em $t0
   	beq $t7, $t0, incrementa_contador  # Se $t7 == $t0, incrementa o contador
    	addi $t8, $t8, 4 # Avança para a próxima posição em arrayB
    	subi $t9, $t9, 1 # Decrementa o contador de elementos de arrayB
    	j loop_interno     # Continua o loop interno

incrementa_contador:
	addi $t4, $t4, 1 # Incrementa o contador de elementos comuns
		
fim_interno:
    	addi $t5, $t5, 4 # Avança para a próxima posição em arrayA
   	subi $t6, $t6, 1 # Decrementa o contador de elementos de arrayA
   	j loop_externo     # Continua o loop externo

fim_externo:
   	move $a0, $t4   # Move o contador para $a0 para impressão
   	jr $ra          # Retorna ao chamador

















	