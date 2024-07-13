.globl main
main:
	li $v0, 5 #leitura int
	syscall
	move $t0, $v0 #t0 == menor
	
	li $v0, 5
	syscall
	move $t1, $v0 #t1 == maior
	
	li $t2, 0 #soma = 0
	
inicio:
	#somar valores no intervalo de [menor, maior]
	bgt $t0, $t1, fim #se 'menor' for maior que 'maior' acabou
	
	add $t2, $t2, $t0 #soma += menor
	
	add $t0, $t0, 1 #menor++
	j inicio
	
fim:
	move $a0, $t2 #soma sera printada
	li $v0, 1 #impressao de inteiro
	syscall
	
	li $v0, 10# Código de serviço para sair do programa
   	syscall          