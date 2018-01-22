var i: integer;

proc square(x: integer): integer;
begin
  return x*x
end;

proc intsqrt(x: integer): integer;
  var a, d: integer;
begin
  a := 0;
  for d := 1, 2 * d while square(a + d) <= x, d div 2 while d >= 1 do
    if square(a + d) <= x then a := a + d end
  end;
  return a;
end;

begin
  for i := 1 to 20 do
    print_num(intsqrt(i));
    newline()
  end
end.

(*<<
1
1
1
2
2
2
2
2
3
3
3
3
3
3
3
4
4
4
4
4
>>*)

(*[[
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc square(x: integer): integer;
	.text
_square:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   return x*x
	ldr r4, [fp, #40]
	mul r0, r4, r4
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

@ proc intsqrt(x: integer): integer;
_intsqrt:
	mov ip, sp
	stmfd sp!, {r0-r1}
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   a := 0;
	mov r4, #0
@   for d := 1, 2 * d while square(a + d) <= x, d div 2 while d >= 1 do
	mov r6, #-1
.L3:
	cmp r6, #0
	blt .L12
	cmp r6, #3
	ldrlo pc, [pc, r6, LSL #2]
	b .L4
	.word .L8
	.word .L9
	.word .L10
.L12:
	mov r6, #0
	mov r5, #1
	b .L11
.L8:
	add r6, r6, #1
.L9:
	lsl r5, r5, #1
	add r0, r4, r5
	bl _square
	ldr r1, [fp, #40]
	cmp r0, r1
	ble .L11
	add r6, r6, #1
.L10:
	mov r1, #2
	mov r0, r5
	bl int_div
	mov r5, r0
	cmp r5, #1
	bge .L11
	add r6, r6, #1
	b .L4
.L11:
@     if square(a + d) <= x then a := a + d end
	add r0, r4, r5
	bl _square
	ldr r1, [fp, #40]
	cmp r0, r1
	bgt .L3
	add r4, r4, r5
	b .L3
.L4:
@   return a;
	mov r0, r4
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   for i := 1 to 20 do
	mov r0, #1
	set r1, _i
	str r0, [r1]
	b .L21
.L18:
	set r5, _i
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
.L21:
	set r0, _i
	ldr r5, [r0]
	cmp r5, #20
	bgt .L17
@     print_num(intsqrt(i));
	mov r0, r5
	bl _intsqrt
	bl print_num
@     newline()
	bl newline
	b .L18
.L17:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
@ End
]]*)
