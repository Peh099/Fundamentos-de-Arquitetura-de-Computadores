	.data 
	SinalNegativo:	.asciiz"-"
	SinalPositivo:	 .asciiz "+"
	VarMant:	.asciiz "0x"
	
	QuebraLinha: .asciiz "\n"
	espacomantissa: .space 4
	.text
main:	
	li $v0,6			#LEITURA DO PRIMEIRO FLOAT
	syscall
	
	mov.s $f12,$f0			#MOVE $f0 PARA $f12 PARA QUE $f0 SEJA IMPRESSO
	li $v0,2			#CHAMADA PARA IMPRESSAO DE FLOAT
	syscall
	
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,QuebraLinha		#IMPRIME O \n
	syscall
	
	c.lt.s 	$f0,$f1			# COMPARA SE O VALOR INFORMADO $f1(=0) É MENOR OU IGUAL AO $f0
	bc1t    funcao_sinal_negativo	# CASO FOR MENOR VÁ PARA sinal_negativo
	jal	funcao_sinal_positivo

return_neg:
	jal	funcao_print_valor_exp	#CHAMADA FUNCAO PARA IMPRIMIR O VALOR DO EXP
	jal	funcao_print_mantissa	#CHAMADA FUNCAO PARA IMPRIMIR A MANTISSA

exit:
	li $v0, 10			#system call for exit
	syscall 
	
	
funcao_sinal_positivo:
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,SinalPositivo		# IMPRIME SINALPOSITIVO
	syscall
			
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,QuebraLinha		# IMPRIME \n
	syscall
	
	jr $ra				#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
	
funcao_sinal_negativo:
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,SinalNegativo		# IMPRIME SINALNEGATIVO
	syscall
	
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,QuebraLinha		# IMPRIME \n
	syscall
	
	j return_neg			#FACA O JUMP PARA IR DIRETAMENTE PARA RETURN_NEG

funcao_print_valor_exp:
	mfc1 	$t0,$f0			# CARREGA O VALOR CONTIDO EM $f0 PARA $t0
	
	sll	$t0,$t0,1		#DESLOCA 1 POSICAO DE $t0 PARA A ESQUERDA
	srl	$t0,$t0,24		#DESLOCA 24 POSICOES DE $t0 PARA A DIREITA
	addi	$t1,$t0,-127		#SUBTRAI 127 DE $t0 E ARMAZENA EM $t1
	
	li $v0,1 			#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $t1			#MOVE $t1 PARA $a0, PARA QUE $t1 POSSA SER IMPRESSO
	syscall
	
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,QuebraLinha		# IMPRIME \n
	syscall
	
	jr $ra				#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO

funcao_print_mantissa:

	mfc1 	$t2,$f0			# CARREGA O VALOR CONTIDO EM $f0 PARA $t2
	
	sll	$t2,$t2,9		#DESLOCA 9 POSICOES DE $t0 PARA A ESQUERDA
	srl	$t2,$t2,9		#DESLOCA 9 POSICOES DE $t0 PARA A DIREITA
	la 	$t3,($t2)		## Carrega #t3 em $t8
	
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,VarMant			# IMPRIME 0x
	syscall
	
	la $t4, espacomantissa		#CARREGA EM $t4 O VALOR DE ESPACOMANTISSA
	li $t5, 8			#CARREGA EM $t5 O VALOR 8 QUE SERA O NUMERO DE VEZES QUE A FUNCAO IRA DECREMENTAR
	j funcao_incio_mantissa		#VAI DIRETO PARA A FUNCAO_INICIO_MANTISSA, RESPONSAVEL POR CONVERTER PARA HEXADECIMAL

funcao_incio_mantissa:
	beqz $t5,funcao_continue_print			#CONDICAO DE PARADA DO FOR, $t5==0
	rol 	$t2,$t2, 4				#ROTACIONA A MANTISSA ARMAZENADA EM $t2 PARA A ESQUERDA 4 VEZES 
	andi 	$t6,$t2, 0xF				#FAZ A OPERACAO AND ENTRE 0xF E CONTEUDO DE $t2 E ARMAZENA EM $t6
	ble 	$t6, 9, funcao_numero_menor		#CASO CONTEUDO DE $t6 <= A 9, VA PARA FUNCAO_NUMERO_ESCOLHIDO
	addi 	$t6,$t6, 55				#SE NAO O NUMERO SERA UMA LETRA (A,B,C,D OU E), POR ISSO ADICIONE 55 PARA CORRESPONDER A RESPECTIVA LETRA NA TABELA ASCII
	j funcao_hexa					#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
		
funcao_continue_print:
	li 	$v0,4			#CHAMADA IMPRESSAO DE STRING
	la 	$a0,espacomantissa	#IMPRIMIR O RESPECTIVO ENDERECO DA MANTISSA CONVERTIDA PARA HEXADECIMAL
	syscall
	
	li 	$v0,4			#CHAMADA IMPRESSAO DE STRING
	la  	$a0,QuebraLinha		#IMPRIMIR \n
	syscall	
	jr	$ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO

funcao_numero_menor:
	addi $t6,$t6,48			# COMO É UM NUMERO <=9, SERÁ ADICIONADO 48 AO NUMERO QUE REPRESENTARA SUA RESPECTIVA POSICAO NA TABELA ASCII

funcao_hexa:
	sb 	$t6,0($t4)		#CARREGA OS 8 ULTIMOS BITS DE $t6 EM $t4
	addi 	$t4,$t4,1		#SOMA 1 A $t4
	addi 	$t5,$t5,-1		#SOMA -1 A $t5, QUE SERA O DECREMENTO DO LOOP DA FUNCAO
	j 	funcao_incio_mantissa	#VA DIRETAMENTE PARA O INICO DO LOOP