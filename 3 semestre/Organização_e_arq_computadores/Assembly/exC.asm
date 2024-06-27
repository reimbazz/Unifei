.data
    msg_sim: .asciiz "sim\n"  # Mensagem para sim
    msg_nao: .asciiz "nao\n"  # Mensagem para nao
    
.text
.globl main

main:
	#ler a idade
	 li $v0, 5 
	 syscall
	 move $t0, $v0 #t0 = idade
	 
	  li $v0, 5
	  syscall
	  move $t1, $v0 #t1 = anosTrabalho
	  
	  li $v0, 59 #idade minima (-1 pois tem q ser maior
	  li $v1, 29 #tempoTrab minimo
	  
	  #analise do primeiro caso
	  bgt $t0, $v0, caso1
	  
	  #analise dos demais casos
	  li $v0, 64 #idade minima passa a ser 65 anos para mais comparações
	  li $v1, 34 #mesma ideia no tempoTrab
	  
	  bgt $t0, $v0, msgSim #caso qlqr uma das 2 forem verdades a pessoa ja pode se aposentar
	  bgt $t1, $v1, msgSim
	  
	  #tudo falhou entao ela nao pode
	  j msgNao
	  
caso1:
	  bgt $t1, $v1, msgSim
	  #analise dos demais casos
	  li $v0, 64
	  li $v1, 34
	  
	  bgt $t0, $v0, msgSim
	  bgt $t1, $v1, msgSim
	  
	  j msgNao
	  
msgSim:
	  la $a0, msg_sim # Carrega o endereço da mensagem "Sim"
    	  li $v0, 4          # Código de serviço para imprimir uma string
    	  syscall 
    	  
    	  j fim
    	  
msgNao:
	  la $a0, msg_nao # Carrega o endereço da mensagem "nao"
   	  li $v0, 4          # Código de serviço para imprimir uma string
          syscall 
          
fim:
	 # Finaliza o programa
   	 li $v0, 10         # Código de serviço para sair do programa
   	 syscall            # Chama o sistema para encerrar o programa