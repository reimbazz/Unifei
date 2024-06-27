.globl main
main:
	#leitura N
	li $v0, 5
	syscall
	move $t0, $v0 #t0 = N
	
	#iniciando variaveis resultado e i
	li $t1, 1 #resultado
	li $t2, 0 #i
	
inicio:
	#saida do loop
	beq $t2, $t0, fim
	
	#i++
	add $t2, $t2, 1
	
	#resultado
	mul $t1, $t1, $t2
	
	#voltando o loop
	j inicio
	
fim:
	#print resultado
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10       # Código de serviço para sair do programa
    	syscall          # Chama o sistema para encerrar o programa