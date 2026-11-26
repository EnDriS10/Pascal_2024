{$mode objfpc}{$H-}{$R+}{$Q+}{$V+}{$warnings on}
{
	Mala idea! Y tiene un 0 como nota!
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program incrementar;

var
	x: integer;

procedure incr();
begin
	x := x + 1;
end;

const
	Num = 1;
begin
	x := Num;
	incr();
	writeln(x);
end.
