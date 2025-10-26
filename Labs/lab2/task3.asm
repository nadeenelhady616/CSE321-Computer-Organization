.data
prompt: .asciiz "select a case [1, 2, 2]: \n"
case1: .asciiz "You selected case 1\n"
case2: .asciiz "You selected case 2\n"
case3: .asciiz "You selected case 3\n"
wrong: .asciiz "Wrong input\n"


.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
switch:
    li $t1, 1
    beq $t0, $t1, case_1
    li $t1, 2
    beq $t0, $t1, case_2
    li $t1, 3
    beq $t0, $t1, case_3
    j wrong_case
case_1:
    li $v0, 4
    la $a0, case1
    syscall
    j exit
case_2:
    li $v0, 4
    la $a0, case2
    syscall
    j exit
case_3:
    li $v0, 4
    la $a0, case3
    syscall
    j exit
wrong_case:
    li $v0, 4
    la $a0, wrong
    syscall
exit:
    li $v0, 10
    syscall