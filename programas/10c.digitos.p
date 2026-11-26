{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	escribir digitos separados
	fpc -g -oa.out $% && a.out
}
program digitos;

uses math;

function valordigito(n, pos, base: integer): integer;
begin
	result := (n div base**(pos-1)) mod base;
end;

const
	Num: integer = 134;
	Base: integer = 2;
begin
	writeln(valordigito(Num, 3, Base));
	writeln(valordigito(Num, 2, Base));
	writeln(valordigito(Num, 1, Base));
end.
