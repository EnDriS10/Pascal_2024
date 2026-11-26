{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program ambitos;

{Nunca declarar variables aqui!. Esto es para jugar con ambitos}
var
	n: integer; {1}

procedure incr(var n: integer);
begin
	n := n + 1;
end;

procedure jugar(n: integer);
begin
	incr(n);
	writeln(n);
end;

begin
	read(n);
	incr(n);
	writeln(n);
	jugar(n);
	writeln(n);
end.
