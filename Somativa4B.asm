	.data 
	invalido:	.asciiz "Entrada invalida.\n"
	sim:		.asciiz "sim\n"
	nao: 		.asciiz "nao\n"
	.text
main:
	li $v0,5			#LEITURA DO NUMERO INTEIRO
	syscall
	
	move $a0,$v0			#MOVE O NUMERO LIDO PARA $a0
	
	addi $t0,$zero,1		#INICIALIZA O CONTADOR COM O VALOR 1
	
	ble $a0, 0, num_invalido	#SE O NUMERO LIDO FOR MENOR IGUAL A ZERO IMPRIMA INVALIDO
	
	jal while			#INICIA O FOR 
while:
	beq $t0, $a0, saida		#SE O CONTADOR FOR IGUAL AO NUMERO LIDO VA PARA SAIDA, CONDICAO DE PARADA 
	
	beq $t3,2,num_nao		#SE O CONTADOR (EM $t3) FOR IGUAL A 2, VA PARA NUM_NAO
	beq $t0, 15, num_sim		#SE O CONTADOR (EM $t3) FOR IGUAL A 15, VA PARA NUM_SIM
	
	div $a0,$t0			#DIVIDE O INCREMENTO POR 2
	mfhi $t1			#GUARDA O VALOR DO RESTO EM $t2
	beq $t1, 0, incremento		#SE O RESTO FOR DIFERENTE DE 0 VA PARA IMPAR
	
	addi $t0, $t0, 1		#ADICIONA 1 AO CONTADOR 
	
	j while
	
saida: 
	beq $t3,1, num_sim		#SE O CONTADOR(EM $t3) FOR IGUAL A 1, EH PRIMO, IMPRIMA SIM
	bne $t3,1, num_nao		#SE O CONTADOR(EM $t3) FOR DIFERENTE DE 1, EH PRIMO, IMPRIMA SIM
	
incremento:
	addi $t3, $t3, 1		#ADICIONA 1 AO REGISTRADOR $t3
	addi $t0, $t0, 1		#ADICIONA 1 AO CONTADOR 
	j while
num_invalido:
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,invalido			#IMPRIME invalido
	syscall
	
	j end				#VA PARA END
num_sim:
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,sim			#IMPRIME sim
	syscall
	
	j end				#VA PARA END
	
num_nao:
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,nao			#IMPRIME nao
	syscall
	
	j end				#VA PARA END

end:
        li $v0, 10 			# Encerra o programa
        syscall