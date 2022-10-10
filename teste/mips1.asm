.data
	.globl main
	Tel: 	.space 15 
	pulalinha: .asciiz "\n"
.text
	main:
		li $v0, 8
		la $a0, Tel
		addi $a1, $zero, 16
		syscall
		
		la $s1, Tel
		addi $t1, $zero, 15
		
	Verifica:
		lb $t2, ($s1) 
		slti $t3, $t2, 64
		beq $t3, $zero, Converte
	verificafrase:
		addi $s1, $s1, 1
		addi $t1, $t1, -1
		bne $t1, $zero, Verifica
		j Exit
		
		
	Converte:
		slti $t3, $t2, 68
		beq $t3, 1, if1
		slti $t3, $t2, 71
		beq $t3, 1, if2
		slti $t3, $t2, 74
		beq $t3, 1, if3
		slti $t3, $t2, 77
		beq $t3, 1, if4
		slti $t3, $t2, 80
		beq $t3, 1, if5
		slti $t3, $t2, 84
		beq $t3, 1,if6
		slti $t3, $t2, 87
		beq $t3, 1, if7
		slti $t3, $t2, 91
		beq $t3, 1, if8
		j casonao
		
	if1:
		addi $s7, $zero, 50
		sb $s7, ($s1)
		j verificafrase
	
	if2:
		addi $s7, $zero, 51
		sb $s7, ($s1)
		j verificafrase
		
	if3:
		addi $s7, $zero, 52
		sb $s7, ($s1)
		j verificafrase
		
	if4:
		addi $s7, $zero, 53
		sb $s7, ($s1)
		j verificafrase
		
	if5:
		addi $s7, $zero, 54
		sb $s7, ($s1)
		j verificafrase
		
	if6:
		addi $s7, $zero, 55
		sb $s7, ($s1)
		j verificafrase
		
	if7:
		addi $s7, $zero, 56
		sb $s7, ($s1)
		j verificafrase
		
	if8:
		addi $s7, $zero, 57
		sb $s7, ($s1)
		j verificafrase
		
	casonao:
		j main
		
	Exit:
		li $v0, 4
		la $a0, Tel
		syscall
		
		li $v0, 10
		syscall	
