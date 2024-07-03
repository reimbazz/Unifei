.globl main

main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	#caso seja menor ou igual a zero, volta tudo
	bltz $t0, main
	beqz $t0, main
	
	li $t1, 0 #t1 vai armazenar a soma
	li $t2, 1 #t2 vai ser o i
	
inicio:
	#escape do loop	
	beqz $t0, fim
	
	#soma += i
	add $t1, $t1, $t2
	
	#i++
	add $t2, $t2, 1
	
	#t0--
	sub $t0, $t0, 1
	
	#retorna o loop
	j inicio

fim:
	#print soma
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10       # Código de serviço para sair do programa
    	syscall          # Chama o sistema para encerrar o programa