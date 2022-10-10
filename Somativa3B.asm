	.data 
	Thumsx3:	.asciiz "THUMS THUMS THUMS"
	Thumsx6:	.asciiz "THUMS THUMS THUMS THUMS THUMS THUMS"
	QuebraLinha: .asciiz "\n"
	.text
main:
	li $v0,5			#LEITURA DO PRIMEIRO INTEIRO
	syscall
	
	move $t0,$v0			#MOVE $v0 PARA $t0
		
	jal while			#INICIA O FOR 
	
	li $s0, 0			#DECLARA A VARIAVEL PARA FAZER INCREMENTO DA FUNCAO
	
while:
	
	beq $s0, $t0, saida		#VERIFICA SE A VARIAVEL $s0 É IGUAL $t0, SE SIM O LOOP ACABOU, SE NAO CONTINUA
	li $t1, 2			#INICIALIZA $t0 QUE É O NUMERO DO DIVISOR
	
	div $s0,$t1			#DIVIDE O INCREMENTO POR 2
	mfhi $t2			#GUARDA O VALOR DO RESTO EM $t2
	bne $t2, 0, impar		#SE O RESTO FOR DIFERENTE DE 0 VA PARA IMPAR
	
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Thumsx3			#IMPRIME O THUMSX3
	syscall
	
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,QuebraLinha		#IMPRIME O \n
	syscall
	
	addi $s0,$s0,1			#ADICIONA 1 NO INCREMENTO
	j while				#VA PARA PROXIMA INTERACAO DO LOOP
	
impar:
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,Thumsx6			#IMPRIME THUMSX6
	syscall
	
	li $v0,4			#CHAMADA PARA IMPRESSAO DE STRING
	la $a0,QuebraLinha			#IMPRIME O \n
	syscall
	
	addi $s0,$s0,1			#ADICIONA 1 NO INCREMENTO
	
	j while				#VA PARA PROXIMA INTERACAO DO LOOP

saida:
	li $v0, 10			#system call for exit
	syscall 			
