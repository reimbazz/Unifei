.data
    msg_positivo: .asciiz "positivo\n"  # Mensagem para valor positivo
    msg_negativo: .asciiz "negativo\n"  # Mensagem para valor negativo

.text
.globl main

main:
    # Lê um inteiro do usuário
    li $v0, 5          # Código de serviço para ler um inteiro
    syscall            # Chama o sistema para executar a leitura
    move $t0, $v0      # Move o valor lido para o registrador $t0

    # Verifica se o valor é positivo ou negativo
    bltz $t0, negativo # Se $t0 < 0, pula para a etiqueta 'negativo'
    
    # Se não for negativo, é positivo (ou zero, tratado como positivo)
    la $a0, msg_positivo # Carrega o endereço da mensagem "positivo"
    li $v0, 4          # Código de serviço para imprimir uma string
    syscall            # Chama o sistema para executar a impressão
    j fim              # Pula para o fim do programa

negativo:
    la $a0, msg_negativo # Carrega o endereço da mensagem "negativo"
    li $v0, 4          # Código de serviço para imprimir uma string
    syscall            # Chama o sistema para executar a impressão

fim:
    # Finaliza o programa
    li $v0, 10         # Código de serviço para sair do programa
    syscall            # Chama o sistema para encerrar o programa
