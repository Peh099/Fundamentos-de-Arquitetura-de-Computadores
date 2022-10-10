	.data
	.text
main:	
	li $v0, 5		 #LEITURA DO PRIMEIRO INTEIRO
	syscall
	move $a0,$v0		#MOVE $v0 PARA $a0
	
	li $v0, 5		 #LEITURA DO SEGUNDO INTEIRO
	syscall
	move $a1,$v0		#MOVE $v0 para $a1
	
	jal Funcao_teleferico	#PONTO ENTRADA DA FUNCAO
	add $t0, $v0, $zero 	#PONTO DE OBSERVACAO
	
	li $v0,1 		#CHAMADA PARA IMPRESSAO DE INTEIRO
	move $a0, $t0		#MOVE T0 PARA A0, PARA QUE T0 POSSA SER IMPRESSO
	syscall
	
	li   $v0, 10         	#system call for exit
     	syscall
	
Funcao_teleferico:
	addi $sp, $sp, -12	#PREPARA A PILHA PARA RECEBER 3 ITEM
	sw $t2, 8 ($sp)		#EMPILHA $t2
	sw $t1, 4 ($sp)		#EMPILHA $t1
	sw $s0, 0 ($sp)		#EMPILHA $s0
	addi $t2, $a0, -1	#SUBTRAI $a0 -1 e ARMAZENA EM $t2
	div $t0, $a1, $t2	#FAZ A DIVISAO DE $a1 E $t2 e armazena em $t0
	add $s0, $t0, $zero	#SOMA 0 AO $t0 E ARMAZENA EM $s0
	
	mfhi $t1		#MOVE O CONTEUDO DE $hi PARA $t1
	bgt $t1, $zero, L1	#DESVIA PARA L1 SE $t1>0
	
	add $v0,$s0,$zero	#VALOR DE RETORNO EH PASSADO PARA $v0	
	
	lw $s0, 0 ($sp)		#RESTAURA O ENDERECO DE RETORNO
	addi $sp, $sp, 12	#RETIRA TRES ITENS DA PILHA
	jr $ra			#RETORNO PARA CHAMADORA
	
L1: 	addi $v0, $t0, 1 	#SE $a0 = $a1, v0 RECEBE 1
	jr $ra			#RETORNO PARA CHAMADORA