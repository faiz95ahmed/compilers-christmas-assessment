var i, k: integer;

proc iterator(): integer;
begin
    i := i + 1;
    return i;
end;

begin
  i := 0;
  for k := 1 step iterator() until 100  do
    print_num(i);
    newline()
  end
end.

(*<<
1
3
5
7
9
11
13
15
17
19
>>*)

(*[[
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

@ proc iterator(): integer;
	.text
_iterator:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@     i := i + 1;
	set r4, _i
	ldr r0, [r4]
	add r5, r0, #1
	str r5, [r4]
@     return i;
	mov r0, r5
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   i := 0;
	mov r0, #0
	set r1, _i
	str r0, [r1]
@   for k := 1 step iterator() until 100  do
	mov r0, #1
	set r1, _k
	str r0, [r1]
	b .L6
.L3:
	bl _iterator
	set r1, _k
	ldr r1, [r1]
	add r0, r1, r0
	set r1, _k
	str r0, [r1]
.L6:
	bl _iterator
	cmp r0, #0
	bgt .L7
	set r0, _k
	ldr r0, [r0]
	cmp r0, #100
	blt .L2
	b .L4
.L7:
	set r0, _k
	ldr r0, [r0]
	cmp r0, #100
	bgt .L2
.L4:
@     print_num(i);
	set r0, _i
	ldr r0, [r0]
	bl print_num
@     newline()
	bl newline
	b .L3
.L2:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _i, 4, 4
	.comm _k, 4, 4
@ End
]]*)
