{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	escribir digitos separados
	fpc -g -oa.out $% && a.out
}
program digitos;

uses math;

function valordigito(n, pos: integer): integer;
begin
	result := (n div 10**(pos-1)) mod 10;
end;

const
	Num: integer = 134;
begin
	writeln(valordigito(Num, 3));
	writeln(valordigito(Num, 2));
	writeln(valordigito(Num, 1));
end.
