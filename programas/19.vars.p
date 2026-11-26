{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	jugar con variables
	fpc -g -oa.out $% && a.out
}
program vars;

var
	x: integer;
	y: integer;
begin
	x := 3;
	y := x + 1;
	x := y div 2;
	writeln('x = ', x);
	writeln('y = ', y);
end.
