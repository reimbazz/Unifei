.data
space: .asciiz " "  # espaço para separar os números

.text
.globl main

main:
	# leitura do inteiro N
	li $v0, 5        # codigo pra ler inteiro
	syscall
	move $t0, $v0    # t0 recebe N
	li $v1, 0 #v1 = 0
	sub $t0, $t0, 1 #tira 1 de t0 pois o loop sai depois que t0 é -1
	li $t1, 1 #t1 = 1
	
inicio:
	bgt $v1, $t0, fim #caso de escape do loop
	
	move $a0, $t1    #move t1 para a0 para impressao
   	li $v0, 1        # codigo para imprimir um inteiro
   	syscall
   	
   	#soma 2 para continuar imprimindo inteiros
   	add $t1, $t1, 2
   	
   	la $a0, space   #passa a string com espaco para a0 para impressao
   	li $v0, 4       #codigo para imprimir inteiro
   	syscall
   	
   	#decrementa t
   	sub $t0, $t0, 1
   	
   	j inicio
   	
fim:
   	# Finaliza o programa
   	li $v0, 10       # Código de serviço para sair do programa
   	syscall          # Chama o sistema para encerrar o programa