.data

firstNumPrompt:     .asciiz "Enter first number:  "
secondNumPrompt:    .asciiz "Enter second number: "
thirdNumPrompt:    .asciiz "Enter third number: "
fourthNumPrompt:    .asciiz "Enter fourth number: "
resultPrompt:       .asciiz "The average is: "


.text

main:
    li $v0, 4
    la $a0, firstNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, secondNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t0, $t0, $t1

    li $v0, 4
    la $a0, thirdNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t0, $t0, $t1

    li $v0, 4
    la $a0, fourthNumPrompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t0, $t0, $t1

    mtc1 $t0, $f0    
    cvt.s.w $f0, $f0          
    li.s $f1, 4.0
    div.s $f12, $f0, $f1 

    li $v0, 4
    la $a0, resultPrompt
    syscall

    li $v0, 2 
    syscall

exit:
    li $v0, 10
    syscall