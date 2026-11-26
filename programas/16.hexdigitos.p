{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	primeros tres digitos hexa
	fpc -g -oa.out $% && a.out
}
program hexdigitos;

uses math;	{por ** }

function valordigito(n, pos, base: integer): integer;
begin
	result := (n div base**(pos-1)) mod base;
end;

function digitohex(valor: integer): char;
begin
	if valor >= 10 then begin
		result := char(ord('A')+valor-10);
	end
	else begin
		result := char(ord('0')+valor);
	end;
end;

const
	Num: integer = 256+15;
	Base: integer = 16;

begin
	writeln(digitohex(valordigito(Num, 3, Base)));
	writeln(digitohex(valordigito(Num, 2, Base)));
	writeln(digitohex(valordigito(Num, 1, Base)));
end.
