        .data

buffer:     .space 256  # Aloca 256 bytes de espaço

        .text
main: 

        li  $v0, 8   # Pega a entrada

        la  $a0, buffer   
        li  $a1, 256

        move    $t0, $a0   # Salva a string digitada em $t0
        syscall

        li  $t1,50		#Salva o caracter "2" em $t1
        li  $t2,51		#Salva o caracter "3" em $t2
        li  $t3,52		#Salva o caracter "4" em $t3
        li  $t4,53		#Salva o caracter "5" em $t4
        li  $t5,54		#Salva o caracter "6" em $t5
        li  $t6,55		#Salva o caracter "7" em $t6
        li  $t7,56		#Salva o caracter "8" em $t7
        li  $t8,57		#Salva o caracter "9" em $t8
altera:
        lb  $a0, ($t0)		#Passa o conteúdo de $t0 para $a0
        beq $a0,0,termina	#Se o caracter respectivo for \0 va para termina
        bge $a0,64,comparador	#Se o caracter respectivo for maior igual a 64 va para comparador
        j proximo		#Se nao va para proximo

comparador:
	ble $a0,67,primeiro	#Se o respectivo caracter for menor que 67 va para primeiro
	ble $a0,70,segundo	#Se o respectivo caracter for menor que 70 va para segundo
	ble $a0,73,terceiro	#Se o respectivo caracter for menor que 73 va para terceiro
	ble $a0,76,quarto	#Se o respectivo caracter for menor que 76 va para quarto
	ble $a0,79,quinto	#Se o respectivo caracter for menor que 79 va para quinto
	ble $a0,83,sexto	#Se o respectivo caracter for menor que 83 va para sexto
	ble $a0,86,setimo	#Se o respectivo caracter for menor que 86 va para setimo
	ble $a0,90,oitavo	#Se o respectivo caracter for menor que 89 va para oitavo
	j proximo

primeiro:
	sb  $t1, ($t0)		#Muda o respectivo caracter para '2'
	j proximo		#Va para proximo
segundo:
	sb  $t2, ($t0)		#Muda o respectivo caracter para '3'
	j proximo		#Va para proximo
terceiro:
	sb  $t3, ($t0)		#Muda o respectivo caracter para '4'
	j proximo		#Va para proximo
quarto:
	sb  $t4, ($t0)		#Muda o respectivo caracter para '5'
	j proximo		#Va para proximo
quinto:
	sb  $t5, ($t0)		#Muda o respectivo caracter para '6'
	j proximo		#Va para proximo
sexto:
	sb  $t6, ($t0)		#Muda o respectivo caracter para '7'
	j proximo		#Va para proximo
setimo:
	sb  $t7, ($t0)		#Muda o respectivo caracter para '8'
	j proximo		#Va para proximo
oitavo:
	sb  $t8, ($t0)		#Muda o respectivo caracter para '9'
	j proximo		#Va para proximo
	                                                                
proximo:
        add $t0,$t0,1		#Adiciona 1 em $t0 para ir para o proximo caracter da string
        j   altera		#Continua a percorrer a string
termina:

        la  $a0, buffer  	
        li  $v0, 4   		# Imprimi a string  
        syscall

end:
        li $v0, 10  # Encerra o programa
        syscall