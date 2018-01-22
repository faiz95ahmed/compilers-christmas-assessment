var i: integer;

begin
  for i := 1, 2, 3, 5, 10 step 10 until 100, 2*i while i < 1000 do
    print_num(i);
    newline()
  end
end.

(*<<
1
2
3
5
10
20
30
40
50
60
70
80
90
100
220
440
880
>>*)

(*[[
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   for i := 1, 2, 3, 5, 10 step 10 until 100, 2*i while i < 1000 do
	mov r4, #-1
.L2:
	cmp r4, #0
	blt .L11
	cmp r4, #6
	ldrlo pc, [pc, r4, LSL #2]
	b .L1
	.word .L4
	.word .L5
	.word .L6
	.word .L7
	.word .L8
	.word .L9
.L11:
	mov r4, #0
	mov r0, #1
	set r1, _i
	str r0, [r1]
	b .L10
.L4:
	add r4, r4, #1
	mov r0, #2
	set r1, _i
	str r0, [r1]
	b .L10
.L5:
	add r4, r4, #1
	mov r0, #3
	set r1, _i
	str r0, [r1]
	b .L10
.L6:
	add r4, r4, #1
	mov r0, #5
	set r1, _i
	str r0, [r1]
	b .L10
.L7:
	add r4, r4, #1
	mov r0, #10
	set r1, _i
	str r0, [r1]
	b .L12
.L8:
	set r5, _i
	ldr r0, [r5]
	add r0, r0, #10
	str r0, [r5]
.L12:
	set r0, _i
	ldr r0, [r0]
	cmp r0, #100
	ble .L10
	add r4, r4, #1
.L9:
	set r5, _i
	ldr r0, [r5]
	lsl r6, r0, #1
	str r6, [r5]
	cmp r6, #1000
	blt .L10
	add r4, r4, #1
	b .L1
.L10:
@     print_num(i);
	set r0, _i
	ldr r0, [r0]
	bl print_num
@     newline()
	bl newline
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
@ End
]]*)