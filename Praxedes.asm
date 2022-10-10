 	.data

buffer:     .space 10  # Aloca 256 bytes de espaço
buffer2:    .space 10
iguais:	.asciiz "iguais"
diferente: .asciiz "diferentes"

        .text
main: 

        li  $v0, 8   # Pega a entrada

        la  $a0, buffer   
        li  $a1, 256

        move    $t0, $a0   # Salva a string digitada em $t0
        syscall

	j atribui

atribui:
	li  $v0, 8   # Pega a entrada
        
        la  $a0, buffer2   
        li  $a1, 256
        
        move    $t1, $a0   # Salva a string digitada em $t1
        syscall
	
	j compara
	
compara:        

	lb $s1, ($t0)
	
	lb $s2, ($t1)
	
   	beq $s1,$s2,igual             # at EOS? yes, fly (strings equal)
	jal diferentes
     

igual:
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,iguais		# IMPRIME SINALPOSITIVO
	syscall
	
	j end

diferentes:
	li $v0,4			#CHAMADA IMPRESSAO DE STRING
	la $a0,diferente		# IMPRIME SINALPOSITIVO
	syscall
	
	j end

end:
        li $v0, 10  # Encerra o programa
        syscall
