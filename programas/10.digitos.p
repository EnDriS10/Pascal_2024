{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	escribir digitos separados
	fpc -g -oa.out $% && a.out
}
program digitos;

function valordigito(n, pos: integer): integer;
begin
	result := 0;
end;

const
	Num: integer = 134;
begin
	writeln(valordigito(Num, 3));
	writeln(valordigito(Num, 2));
	writeln(valordigito(Num, 1));
end.
