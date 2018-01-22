var i,j: integer;

begin
  for i := 1, 2, 3, 5, 10 step 10 until 100, 2*i while i < 1000 do  
    for j := 1, 2, 3, 5, 10 step 10 until 100, 2*j while j < 1000 do
      print_num(i*j); print_char(' ');
    end;
    newline()
  end
end.

(*<<
1 2 3 5 10 20 30 40 50 60 70 80 90 100 220 440 880 
2 4 6 10 20 40 60 80 100 120 140 160 180 200 440 880 1760 
3 6 9 15 30 60 90 120 150 180 210 240 270 300 660 1320 2640 
5 10 15 25 50 100 150 200 250 300 350 400 450 500 1100 2200 4400 
10 20 30 50 100 200 300 400 500 600 700 800 900 1000 2200 4400 8800 
20 40 60 100 200 400 600 800 1000 1200 1400 1600 1800 2000 4400 8800 17600 
30 60 90 150 300 600 900 1200 1500 1800 2100 2400 2700 3000 6600 13200 26400 
40 80 120 200 400 800 1200 1600 2000 2400 2800 3200 3600 4000 8800 17600 35200 
50 100 150 250 500 1000 1500 2000 2500 3000 3500 4000 4500 5000 11000 22000 44000 
60 120 180 300 600 1200 1800 2400 3000 3600 4200 4800 5400 6000 13200 26400 52800 
70 140 210 350 700 1400 2100 2800 3500 4200 4900 5600 6300 7000 15400 30800 61600 
80 160 240 400 800 1600 2400 3200 4000 4800 5600 6400 7200 8000 17600 35200 70400 
90 180 270 450 900 1800 2700 3600 4500 5400 6300 7200 8100 9000 19800 39600 79200 
100 200 300 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 22000 44000 88000 
220 440 660 1100 2200 4400 6600 8800 11000 13200 15400 17600 19800 22000 48400 96800 193600 
440 880 1320 2200 4400 8800 13200 17600 22000 26400 30800 35200 39600 44000 96800 193600 387200 
880 1760 2640 4400 8800 17600 26400 35200 44000 52800 61600 70400 79200 88000 193600 387200 774400 
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
	mov r5, #-1
.L2:
	cmp r5, #0
	blt .L26
	cmp r5, #6
	ldrlo pc, [pc, r5, LSL #2]
	b .L1
	.word .L19
	.word .L20
	.word .L21
	.word .L22
	.word .L23
	.word .L24
.L26:
	mov r5, #0
	mov r0, #1
	set r1, _i
	str r0, [r1]
	b .L25
.L19:
	add r5, r5, #1
	mov r0, #2
	set r1, _i
	str r0, [r1]
	b .L25
.L20:
	add r5, r5, #1
	mov r0, #3
	set r1, _i
	str r0, [r1]
	b .L25
.L21:
	add r5, r5, #1
	mov r0, #5
	set r1, _i
	str r0, [r1]
	b .L25
.L22:
	add r5, r5, #1
	mov r0, #10
	set r1, _i
	str r0, [r1]
	b .L27
.L23:
	set r6, _i
	ldr r0, [r6]
	add r0, r0, #10
	str r0, [r6]
.L27:
	set r0, _i
	ldr r0, [r0]
	cmp r0, #100
	ble .L25
	add r5, r5, #1
.L24:
	set r6, _i
	ldr r0, [r6]
	lsl r7, r0, #1
	str r7, [r6]
	cmp r7, #1000
	blt .L25
	add r5, r5, #1
	b .L1
.L25:
@     for j := 1, 2, 3, 5, 10 step 10 until 100, 2*j while j < 1000 do
	mov r4, #-1
.L4:
	cmp r4, #0
	blt .L13
	cmp r4, #6
	ldrlo pc, [pc, r4, LSL #2]
	b .L5
	.word .L6
	.word .L7
	.word .L8
	.word .L9
	.word .L10
	.word .L11
.L13:
	mov r4, #0
	mov r0, #1
	set r1, _j
	str r0, [r1]
	b .L12
.L6:
	add r4, r4, #1
	mov r0, #2
	set r1, _j
	str r0, [r1]
	b .L12
.L7:
	add r4, r4, #1
	mov r0, #3
	set r1, _j
	str r0, [r1]
	b .L12
.L8:
	add r4, r4, #1
	mov r0, #5
	set r1, _j
	str r0, [r1]
	b .L12
.L9:
	add r4, r4, #1
	mov r0, #10
	set r1, _j
	str r0, [r1]
	b .L14
.L10:
	set r6, _j
	ldr r0, [r6]
	add r0, r0, #10
	str r0, [r6]
.L14:
	set r0, _j
	ldr r0, [r0]
	cmp r0, #100
	ble .L12
	add r4, r4, #1
.L11:
	set r6, _j
	ldr r0, [r6]
	lsl r7, r0, #1
	str r7, [r6]
	cmp r7, #1000
	blt .L12
	add r4, r4, #1
	b .L5
.L12:
@       print_num(i*j); print_char(' ');
	set r0, _i
	ldr r0, [r0]
	set r1, _j
	ldr r1, [r1]
	mul r0, r0, r1
	bl print_num
	mov r0, #32
	bl print_char
	b .L4
.L5:
@     newline()
	bl newline
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
	.comm _j, 4, 4
@ End
]]*)