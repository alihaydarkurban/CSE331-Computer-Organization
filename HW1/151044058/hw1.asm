#	ALI HAYDAR KURBAN 151044058
.data
	FileName : .asciiz "input_hw1.txt"	#Name of fle
	Word : .space 256	 #Maximum number of characters to read	
	zero : .asciiz "zero"
	Zero : .asciiz "Zero"
	one : .asciiz "one"
	One : .asciiz "One"
	two : .asciiz "two"
	Two : .asciiz "Two"
	three : .asciiz "three"
	Three : .asciiz "Three"
	four : .asciiz "four"
	Four : .asciiz "Four"
	five : .asciiz "five"
	Five : .asciiz "Five"
	six : .asciiz "six"
	Six : .asciiz "Six"
	seven : .asciiz "seven"
	Seven : .asciiz "Seven"
	eight : .asciiz "eight"
	Eight : .asciiz "Eight"
	nine: .asciiz "nine"
	Nine : .asciiz "Nine"	
.text
	main :
		#Open file
		li $v0, 13 #System call to open file
		la $a0, FileName #File descriptor
		li $a1, 0 #Open the file for reading (0 meand reading)
		syscall
		move $s0, $v0 #Save the file descriptor
	
		#Read file
		li $v0, 14 #System call for reading from file
		move $a0, $s0 #Move the file descriptor to $a0
		la $a1, Word #Address of input buffer to read
		la $a2, 256 #Maximum number of characters to read
		syscall
			
		la $s0, Word	#Load address
		add $s1, $s0, -3	#Iki onceki adrese gitmek icin
		add $s2, $s0, -2	#Bir onceki adrese gitmek icin
		add $s3, $s0, $zero	#Birsonraki adrese gitmek icin
		add $s4, $s0, 1		#Iki sonraki adrese gitmek icin

		myLoop :
			lb $t0, 0($s0)		#Load byte
			
			add $s0, $s0 , 1	#Adresi 1 attirma
			add $s1, $s1, 1		#Adresi 1 attirma
			add $s2, $s2, 1		#Adresi 1 attirma
			add $s3, $s3, 1		#Adresi 1 attirma
			add $s4, $s4, 1		#Adresi 1 attirma
			
			lb $t1, 0($s1)		#Load byte
			lb $t2, 0($s2)		#Load byte
			lb $t3, 0($s3)		#Load byte
			lb $t4, 0($s4)		#Load byte
			
			beq $t0,'0', num_zero	#Okunan karakterin 0 olmasi
			beq $t0,'1', num_one	#Okunan karakterin 2 olmasi
			beq $t0,'2', num_two	#Okunan karakterin 3 olmasi
			beq $t0,'3', num_three	#Okunan karakterin 3 olmasi
			beq $t0,'4', num_four	#Okunan karakterin 4 olmasi
			beq $t0,'5', num_five	#Okunan karakterin 5 olmasi
			beq $t0,'6', num_six	#Okunan karakterin 6 olmasi
			beq $t0,'7', num_seven	#Okunan karakterin 7 olmasi
			beq $t0,'8', num_eight	#Okunan karakterin 8 olmasi
			beq $t0,'9', num_nine	#Okunan karakterin 9 olmasi
			beq $t0, $zero, EndLoop	#Okunan karakterin dosya sonu olmasi
			jal print_character	#Fonksiyonu cagirma
			j myLoop	#myLoop a gitmesi
		
		EndLoop :
			li $v0, 10	#Programi bitirme
			syscall
		num_zero :
			beq $t1, '.', state1_number0	#Iki onceki adres '.' mý
			beq $t4, ' ', state2_1_number0 #Iki sonraki adres ' ' mu
			beq $t3, ' ', state3_1_number0 #Bir sonraki adres ' ' mu
			jal print_character	#Fonksiyonu cagirma
			j myLoop	#myLoop a gitmesi
		#num_zero nun kosullari diger num_one num_two ... num_nine icin gecerlidir
		num_one :
			beq $t1, '.', state1_number1
			beq $t4, ' ', state2_1_number1
			beq $t3, ' ', state3_1_number1
			jal print_character
			j myLoop
		num_two :
			beq $t1, '.', state1_number2
			beq $t4, ' ', state2_1_number2
			beq $t3, ' ', state3_1_number2
			jal print_character
			j myLoop
		num_three :
			beq $t1, '.', state1_number3
			beq $t4, ' ', state2_1_number3
			beq $t3, ' ', state3_1_number3
			jal print_character
			j myLoop
		num_four :
			beq $t1, '.', state1_number4
			beq $t4, ' ', state2_1_number4
			beq $t3, ' ', state3_1_number4
			jal print_character
			j myLoop
		num_five :
			beq $t1, '.', state1_number5
			beq $t4, ' ', state2_1_number5
			beq $t3, ' ', state3_1_number5
			jal print_character
			j myLoop
		num_six :
			beq $t1, '.', state1_number6
			beq $t4, ' ', state2_1_number6
			beq $t3, ' ', state3_1_number6
			jal print_character
			j myLoop
		num_seven :
			beq $t1, '.', state1_number7
			beq $t4, ' ', state2_1_number7
			beq $t3, ' ', state3_1_number7
			jal print_character
			j myLoop
		num_eight :
			beq $t1, '.', state1_number8
			beq $t4, ' ', state2_1_number8
			beq $t3, ' ', state3_1_number8
			jal print_character
			j myLoop
		num_nine :
			beq $t1, '.', state1_number9
			beq $t4, ' ', state2_1_number9
			beq $t3, ' ', state3_1_number9
			jal print_character
			j myLoop
					
		#Close file
		li $v0, 16 #System call to close file
		move $a0, $s0 #Move the file descriptor to $a0
		syscall	
		
print_character :	#Karakter yazdirma fonksiyonu
	li $v0, 11	#Karakter yazdirma islemi
	move $a0, $t0
	syscall	
	jr $ra		#Fonksiyonun geri donmesi
##################################################################################################################################
#state3_1 ifadeleri bir onceki adrese bakip ' ' mu anlar. Eger bosluksa sayidir der ve state3_2 ye gider sayiyi string seklinde yazar
#state3_1 ve state3_2 ifadeleri 0 1 2 ... 9 icin ayri ayri vardir	
state3_1_number0 :	
	beq $t2, ' ', state3_2_number0
	jal print_character	#Ustteki beq saglanmazsa karakteri yazdirir
	j myLoop
state3_2_number0 :
	li $v0, 4 #Address of null-terminated string to print
	la $a0, zero
	syscall
	j myLoop
######################################	
state3_1_number1 :
	beq $t2, ' ', state3_2_number1
	jal print_character
	j myLoop
state3_2_number1 :
	li $v0, 4 
	la $a0, one
	syscall
	j myLoop
######################################		
state3_1_number2 :
	beq $t2, ' ', state3_2_number2
	jal print_character
	j myLoop
state3_2_number2 :
	li $v0, 4 
	la $a0, two
	syscall
	j myLoop
######################################		
state3_1_number3 :
	beq $t2, ' ', state3_2_number3
	jal print_character
	j myLoop
state3_2_number3 :
	li $v0, 4 
	la $a0, three
	syscall
	j myLoop
######################################		
state3_1_number4 :
	beq $t2, ' ', state3_2_number4
	jal print_character
	j myLoop
state3_2_number4 :
	li $v0, 4 
	la $a0, four 
	syscall
	j myLoop
######################################		
state3_1_number5 :
	beq $t2, ' ', state3_2_number5
	jal print_character
	j myLoop
state3_2_number5 :
	li $v0, 4 
	la $a0, five 
	syscall
	j myLoop
######################################		
state3_1_number6 :
	beq $t2, ' ', state3_2_number6
	jal print_character
	j myLoop
state3_2_number6 :
	li $v0, 4 
	la $a0, six 
	syscall
	j myLoop
######################################		
state3_1_number7 :
	beq $t2, ' ', state3_2_number7
	jal print_character
	j myLoop
state3_2_number7 :
	li $v0, 4 
	la $a0, seven 
	syscall
	j myLoop
######################################	
state3_1_number8 :
	beq $t2, ' ', state3_2_number8
	jal print_character
	j myLoop
state3_2_number8 :
	li $v0, 4 
	la $a0, eight 
	syscall
	j myLoop
######################################			
state3_1_number9 :
	beq $t2, ' ', state3_2_number9
	jal print_character
	j myLoop
state3_2_number9 :
	li $v0, 4 
	la $a0, nine 
	syscall
	j myLoop
##################################################################################################################################
#state2_1 ifadeleri bir sonraki adrese bakip '.' mi anlar. Eger noktaysa state2_2 ye gider
#state2_2 ifadeleri bir onceki adrese  bakip ' ' mu anlar. Eger bosluksa sayidir der ve state2_3 e gider sayiyi string seklinde yazdirir
#state2_1 , state2_2 , state2_3 ifadeleri 0 1 2 ... 9 icin ayri ayri vardir

state2_1_number0 :
	beq $t3, '.', state2_2_number0
	jal print_character	#Ustteki beq saglanmazsa karakteri yazdirir
	j myLoop
state2_2_number0 :
	beq $t2, ' ', state2_3_number0
	jal print_character	#Ustteki beq saglanmazsa karakteri yazdirir
	j myLoop 
state2_3_number0 :
	li $v0, 4 #Address of null-terminated string to print
	la $a0, zero
	syscall
	j myLoop
######################################		
state2_1_number1 :
	beq $t3, '.', state2_2_number1
	jal print_character
	j myLoop
state2_2_number1 :
	beq $t2, ' ', state2_3_number1
	jal print_character
	j myLoop 
state2_3_number1 :
	li $v0, 4 
	la $a0, one
	syscall
	j myLoop
######################################		
state2_1_number2 :
	beq $t3, '.', state2_2_number2
	jal print_character
	j myLoop
state2_2_number2 :
	beq $t2, ' ', state2_3_number2
	jal print_character
	j myLoop 
state2_3_number2 :
	li $v0, 4 
	la $a0, two
	syscall
	j myLoop
######################################		
state2_1_number3 :
	beq $t3, '.', state2_2_number3
	jal print_character
	j myLoop
state2_2_number3 :
	beq $t2, ' ', state2_3_number3
	jal print_character
	j myLoop 
state2_3_number3 :
	li $v0, 4 
	la $a0, three
	syscall
	j myLoop
######################################		
state2_1_number4 :
	beq $t3, '.', state2_2_number4
	jal print_character
	j myLoop
state2_2_number4 :
	beq $t2, ' ', state2_3_number4
	jal print_character
	j myLoop 
state2_3_number4 :
	li $v0, 4 
	la $a0, four
	syscall
	j myLoop
######################################		
state2_1_number5 :
	beq $t3, '.', state2_2_number5
	jal print_character
	j myLoop
state2_2_number5 :
	beq $t2, ' ', state2_3_number5
	jal print_character
	j myLoop 
state2_3_number5 :
	li $v0, 4 
	la $a0, five
	syscall
	j myLoop
######################################		
state2_1_number6 :
	beq $t3, '.', state2_2_number6
	jal print_character
	j myLoop
state2_2_number6 :
	beq $t2, ' ', state2_3_number6
	jal print_character
	j myLoop 
state2_3_number6 :
	li $v0, 4 
	la $a0, six
	syscall
	j myLoop
######################################		
state2_1_number7 :
	beq $t3, '.', state2_2_number7
	jal print_character
	j myLoop
state2_2_number7 :
	beq $t2, ' ', state2_3_number7
	jal print_character
	j myLoop 
state2_3_number7 :
	li $v0, 4 
	la $a0, seven
	syscall
	j myLoop
######################################	
state2_1_number8 :
	beq $t3, '.', state2_2_number8
	jal print_character
	j myLoop
state2_2_number8 :
	beq $t2, ' ', state2_3_number8
	jal print_character
	j myLoop 
state2_3_number8 :
	li $v0, 4 
	la $a0, eight
	syscall
	j myLoop
######################################		
state2_1_number9 :
	beq $t3, '.', state2_2_number9
	jal print_character
	j myLoop
state2_2_number9 :
	beq $t2, ' ', state2_3_number9
	jal print_character
	j myLoop 
state2_3_number9 :
	li $v0, 4 
	la $a0, nine
	syscall
	j myLoop
##################################################################################################################################
#state1 ifadeleri bir onceki adrese bakip ' ' mi anlar. Eger noktaysa state2 ye gider
#state2 ifadeleri bir sonraki adrese  bakip ' ' mu anlar. Eger bosluksa sayidir der ve state3 e gider sayiyi string seklinde buyuk harf ile baslatarak yazdirir
#state1 , state2 , state3 ifadeleri 0 1 2 ... 9 icin ayri ayri vardir
	
state1_number0 :
	beq $t2, ' ', state2_number0
	jal print_character	#Ustteki beq saglanmazsa karakteri yazdirir
	j myLoop
state2_number0 :
	beq $t3, ' ', state3_number0
	jal print_character	#Ustteki beq saglanmazsa karakteri yazdirir
	j myLoop 
state3_number0 :
	li $v0, 4 #Address of null-terminated string to print
	la $a0, Zero
	syscall
	j myLoop
######################################		
state1_number1 :
	beq $t2, ' ', state2_number1
	jal print_character 
	j myLoop
state2_number1 :
	beq $t3, ' ', state3_number1
	jal print_character 
	j myLoop
state3_number1 :
	li $v0, 4 
	la $a0, One
	syscall
	j myLoop
######################################
state1_number2 :
	beq $t2, ' ', state2_number2
	jal print_character
	j myLoop
state2_number2 :
	beq $t3, ' ', state3_number2
	jal print_character 
	j myLoop
state3_number2 :
	li $v0, 4 
	la $a0, Two
	syscall
	j myLoop
######################################	
state1_number3 :
	beq $t2, ' ', state2_number3
	jal print_character 
	j myLoop
state2_number3 :
	beq $t3, ' ', state3_number3
	jal print_character 
	j myLoop
state3_number3 :
	li $v0, 4 
	la $a0, Three
	syscall
	j myLoop
######################################	
state1_number4 :
	beq $t2, ' ', state2_number4
	jal print_character 
	j myLoop
state2_number4 :
	beq $t3, ' ', state3_number4
	jal print_character 
	j myLoop
state3_number4 :
	li $v0, 4 
	la $a0, Four
	syscall
	j myLoop
######################################	
state1_number5 :
	beq $t2, ' ', state2_number5
	jal print_character 
	j myLoop
state2_number5 :
	beq $t3, ' ', state3_number5
	jal print_character 
	j myLoop
state3_number5 :
	li $v0, 4 
	la $a0, Five
	syscall
	j myLoop
######################################	
state1_number6 :
	beq $t2, ' ', state2_number6
	jal print_character 
	j myLoop
state2_number6 :
	beq $t3, ' ', state3_number6
	jal print_character 
	j myLoop
state3_number6 :
	li $v0, 4 
	la $a0, Six
	syscall
	j myLoop
######################################	
state1_number7 :
	beq $t2, ' ', state2_number7
	jal print_character 
	j myLoop
state2_number7 :
	beq $t3, ' ', state3_number7
	jal print_character 
	j myLoop
state3_number7 :
	li $v0, 4 
	la $a0, Seven
	syscall
	j myLoop
######################################	
state1_number8 :
	beq $t2, ' ', state2_number8
	jal print_character 
	j myLoop
state2_number8 :
	beq $t3, ' ', state3_number8
	jal print_character 
	j myLoop
state3_number8 :
	li $v0, 4 
	la $a0, Eight
	syscall
	j myLoop
######################################	
state1_number9 :
	beq $t2, ' ', state2_number9
	jal print_character 
	j myLoop
state2_number9 :
	beq $t3, ' ', state3_number9
	jal print_character 
	j myLoop
state3_number9 :
	li $v0, 4 
	la $a0, Nine
	syscall
	j myLoop		
