.data
prompt:    .asciiz "Enter the number of integers: "
numberPrompt: .asciiz "Enter number: "
resultPrompt: .asciiz "The average is: "
.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    li $t1, 0
    li $t2, 1
while:
    bgt $t2, $t0, endloop
    li $v0, 4
    la $a0, numberPrompt
    syscall
    li $v0, 5
    syscall
    add $t1, $t1, $v0
    addi $t2, $t2, 1
    j while
endloop:
    mtc1 $t1, $f0    
    cvt.s.w $f0, $f0          
    mtc1 $t0, $f1    
    cvt.s.w $f1, $f1 
    div.s $f12, $f0, $f1
    li $v0, 4
    la $a0, resultPrompt
    syscall
    li $v0, 2
    syscall
exit:
    li $v0, 10
    syscall


