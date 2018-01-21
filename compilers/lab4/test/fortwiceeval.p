var i: integer;

proc iterator(): integer;
begin
    i := i + 1;
    return i;
end;

begin
  i := 0;
  for k := 1 until 100 step iterator() do
    print_num(iterator());
    newline()
  end
end.