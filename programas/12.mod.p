{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	aritmetica modular

	fpc -g -oa.out $% && a.out
}
program carfun;

uses math;

function sigmod(n, modulo: integer): integer;
begin
	result := (n+1) mod modulo;
end;

function antmod(n, modulo: integer): integer;
begin
	result := (n+modulo-1) mod modulo;
end;

begin
	writeln(sigmod(2, 4));
	writeln(sigmod(3, 4));
	writeln(sigmod(4, 4));
	writeln(antmod(1, 4));
	writeln(antmod(0, 4));
end.
