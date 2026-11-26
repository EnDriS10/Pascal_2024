{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	signo de un entero
	fpc -g -oa.out $% && a.out
}
program signos;

function signo(n: integer): integer;
begin
	if n > 0 then begin
		result := 1;
	end
	else if n = 0 then begin
		result := 0;
	end
	else begin
		result := -1;
	end;
end;

begin
	writeln(signo(-5));
	if signo(8) = 1 then begin
		writeln('8 es positivo');
	end;
	
end.
