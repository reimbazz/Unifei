.globl main
main:
	li $v0, 5 #read int
	syscall
	move $t0, $v0 #t0 = valor
	
	li $t1, 1 #aux = 1
	jal quadrado_perfeito
	
	li $v0, 1#codigo para printar inteiro
	syscall
	# Termina o programa
    	li $v0, 10         # Código do syscall para exit
    	syscall
	
quadrado_perfeito:
	mul $t2, $t1, $t1 #result = aux * aux
	beq $t0, $t2, sim
	addi $t1, $t1, 1 #aux += 1
	beq $t1, $t0, nao
	j quadrado_perfeito #retorna ao loop
sim: 
	li $a0, 1 #resposta afirmativa
	jr $ra
nao:
	li $a0, 0 #negativa
	jr $ra
