	.data 
	Add: .asciiz"ADD: "
	Sub: .asciiz"\nSUB: "
	And: .asciiz"\nAND: "
	Or: .asciiz"\nOR: "
	Xor: .asciiz"\nXOR: " 
	Mask: .asciiz"\nMASK: "
	SLLa: .asciiz"\nSLL("
	SLLb: .asciiz"): "
	SRLa: .asciiz"\nSRL("
	SRLb:  .asciiz"): "
	
	QuebraLinha: .asciiz "\n"
	.text
main:
	li $v0, 5		 #LEITURA DO PRIMEIRO INTEIRO
	syscall
	move $t0,$v0		#MOVE $v0 PARA $t0
	
	li $v0, 5		 #LEITURA DO SEGUNDO INTEIRO
	syscall
	move $t1,$v0		#MOVE $v0 para $t1
	
	li $v0, 5		 #LEITURA DO TERCEIRO INTEIRO
	syscall
	move $t2,$v0		#MOVE $v0 PARA $t2
	
	jal funcao_soma		#CHAMA A FUNCAO PARA SOMAR E IMPRIMIR
	jal funcao_sub		#CHAMA A FUNCAO PARA SUBTRAIR E IMPRIMIR
	jal funcao_and_or_xor	#CHAMA A FUNCAO PARA FAZER AS OP. AND OR E XOR E IMPRIMIR
	jal funcao_mask		#CHAMA A FUNCAO MASK PARA FAZER O AND DE C E 31 E IMPRIMIR
	jal funcao_sll_srl	#CHAMA A FUNCAO PARA FAZER A OP SLL E SRL E IMPRIMIR
	
	li   $v0, 10         	#system call for exit
     	syscall
	
funcao_soma:
	add $s0,$t0,$t1		# FAZ A SOMA DE $t0 COM $t1 E ARMAZENA EM $s0
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Add		#IMPRIME ADD
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s0		#MOVE $s0 PARA $a0, PARA QUE $s0 POSSA SER IMPRESSO
	syscall
	
	jr $ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
funcao_sub:
	sub $s1,$t0,$t1		# FAZ A SUBTRACAO DE $t0 COM $t1 E ARMAZENA EM $s1
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Sub		#IMPRIME SUB
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s1		#MOVE $s1 PARA $a0, PARA QUE $s1 POSSA SER IMPRESSO
	syscall
	
	jr $ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
	
funcao_and_or_xor:
	and $s2,$t0,$t1		# FAZ A OPERACAO AND ENTRE $t0 e $t1 E ARMAZENA EM $s2
			
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,And		#IMPRIME AND
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s2		#MOVE $s2 PARA $a0, PARA QUE $s2 POSSA SER IMPRESSO
	syscall
	
	or $s3,$t0,$t1		# FAZ A OPERACAO OR ENTRE $t0 e $t1 E ARMAZENA EM $s3

	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Or		#IMPRIME OR
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s3		#MOVE $s3 PARA $a0, PARA QUE $s3 POSSA SER IMPRESSO
	syscall
	
	xor $s4,$t0,$t1		# FAZ A OPERACAO XOR ENTRE $t0 e $t1 E ARMAZENA EM $s4
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Xor		#IMPRIME XOR
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s4		#MOVE $s4 PARA $a0, PARA QUE $s4 POSSA SER IMPRESSO
	syscall
	
	jr $ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
	
funcao_mask:
	and $s5,$t2,31		# FAZ A OPERACAO AND ENTRE $t2 e 31 E ARMAZENA EM $s5
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Mask		#IMPRIME MASK
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s5		#MOVE $s5 PARA $a0, PARA QUE $s5 POSSA SER IMPRESSO
	syscall
	
	jr $ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
	
funcao_sll_srl:
	sllv $t3,$t0,$s5 	# FAZ A OPERACAO SLL ENTRE $s5 e $t0 E ARMAZENA EM $t3
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,SLLa		#IMPRIME SLLa
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s5		#MOVE $s5 PARA $a0, PARA QUE $s5 POSSA SER IMPRESSO
	syscall
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,SLLb		#IMPRIME SLLb
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $t3		#MOVE $t3 PARA $a0, PARA QUE $t3 POSSA SER IMPRESSO
	syscall
	
	srlv $t4,$t1,$s5	# FAZ A OPERACAO SRL ENTRE $s5 e $t0 E ARMAZENA EM $t3
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,SRLa		#IMPRIME SLLa
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $s5		#MOVE $s5 PARA $a0, PARA QUE $s5 POSSA SER IMPRESSO
	syscall
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,SRLb		#IMPRIME SLLb
	syscall
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $t4		#MOVE $t4 PARA $a0, PARA QUE $t4 POSSA SER IMPRESSO
	syscall
	
	li $v0,4		#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,QuebraLinha	#IMPRIME \n
	syscall
	
	jr $ra			#RETORNA PARA A LINHA DEBAIXO DE ONDE FOI CHAMADO
	
	


	
	
	
