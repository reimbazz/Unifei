.data
    msg_isosceles: .asciiz "isosceles\n"  # Mensagem para isosceles
    msg_escaleno: .asciiz "escaleno\n"  # Mensagem para escaleno
    msg_equilatero: .asciiz "equilatero\n" #Mensagem para equilatero
    
.text
.globl main

main:
	#leitura do ladoA
	li $v0, 5 
	syscall
	move $t0, $v0 #t0 = ladoA
	
	#leitura ladoB
	li $v0, 5
	syscall
	move $t1, $v0 #t1 = ladoB
	
	#leitura lado C
	li $v0, 5
	syscall
	move $t2, $v0 #t2 = ladoC
	
	beq $t0, $t1, possuiIgual1
	beq $t1, $t2, possuiIgual2
	beq $t0, $t2, possuiIgual3
	
	#se passou por tudo e nao tem nenhum igual ent é escaleno
	la $a0, msg_escaleno
   	li $v0, 4          # Código de serviço para imprimir uma string
        syscall 
        
        j fim
        
possuiIgual1:
	#conferir se existe outro lado igual
	beq $t1, $t2, equilatero
	
	la $a0, msg_isosceles
   	li $v0, 4          # Código de serviço para imprimir uma string
        syscall
        
        j fim
        
 possuiIgual2:
 	#conferir se existe outro igual
 	beq $t0, $t1, equilatero
 		
	la $a0, msg_isosceles
   	li $v0, 4          # Código de serviço para imprimir uma string
        syscall
        
        j fim
        
possuiIgual3:
	#conferir se existe outro igual
 	beq $t0, $t1, equilatero
 		
	la $a0, msg_isosceles
   	li $v0, 4          # Código de serviço para imprimir uma string
        syscall
        
        j fim
        
equilatero:
	#o triangulo é equilatero 		
	la $a0, msg_equilatero
   	li $v0, 4          # Código de serviço para imprimir uma string
        syscall

fim:
	 # Finaliza o programa
   	 li $v0, 10         # Código de serviço para sair do programa
   	 syscall            # Chama o sistema para encerrar o programa