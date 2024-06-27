.globl main

main:
	# Leitura do primeiro inteiro
   	li $v0, 5        # Código de serviço para leitura de inteiro
 	syscall
  	move $t0, $v0    # Move o valor lido de $v0 para $t0
  	  
 	# Leitura do segundo inteiro
  	li $v0, 5        # Código de serviço para leitura de inteiro
  	syscall
  	move $t1, $v0    # Move o valor lido de $v0 para $t1
    
  	# Leitura do terceiro inteiro
  	li $v0, 5        # Código de serviço para leitura de inteiro
  	syscall
  	move $t2, $v0    # Move o valor lido de $v0 para $t2
    
  	# Leitura do quarto inteiro
  	li $v0, 5        # Código de serviço para leitura de inteiro
  	syscall
   	move $t3, $v0    # Move o valor lido de $v0 para $t3
	
 	move $t4, $t0 #t4 é o maior atualmente
 	
 	bgt $t1, $t4, maior1 #se for maior preciso atualizar o valor de $t4
 	
 	#repetir o processo com as demais variaveis
 	bgt $t2, $t4, maior2 #se for maior preciso atualizar o valor de $t4
 	bgt $t3, $t4, maior3 #se for maior preciso atualizar o valor de $t4
 	
 	j fim
 	
 maior1:
 	move $t4, $t1	#atualizo o valor de t4
 	
 	bgt $t2, $t4, maior2 #se for maior preciso atualizar o valor de $t4
 	bgt $t3, $t4, maior3 #se for maior preciso atualizar o valor de $t4
 	j fim
 
 maior2:
 	move $t4, $t2	#atualizo o valor d t4
 	bgt $t3, $t4, maior3 #se for maior preciso atualizar o valor de $t4
 	j fim
 
 maior3:
 	move $t4, $t3	#atualizo o valor d t4
 	j fim
 	
 fim:
 	move $a0, $t4	#move o valor para a0 para impressão
 	li $v0, 1
 	syscall
 	
 	# Finaliza o programa
   	li $v0, 10           # Código de serviço para sair do programa
    	syscall              # Chama o sistema para encerrar o programa