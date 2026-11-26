{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	funciones utiles con char

	fpc -g -oa.out $% && a.out
}
program carfun;

uses math;

const
	Tab: char = '	';

function valornumerico(c: char): integer;
begin
	result := ord(c) - ord('0');
end;

function cardigito(d: integer): char;
begin
	result := char(ord('0') + d);
end;

function esblanco(c: char): boolean;
begin
	result := (c = ' ') or (c = Tab);
end;

const
	Num: integer = 5;
	Car: char = '3';
begin
	writeln(valornumerico(Car));
	writeln(valornumerico(Car) + 2);
	writeln(cardigito(Num));
	writeln(esblanco(Tab));
	writeln(esblanco(';'));
end.
