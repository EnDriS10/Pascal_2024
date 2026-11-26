program incrementar;

procedure incr(var n: integer);
begin
	n := n + 1;
end;

const
	Num = 1;
var
	x: integer;
begin
	x := Num;
	incr(x);
	writeln(x);
end.
