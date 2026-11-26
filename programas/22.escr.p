{$mode objfpc}{$H-}{$R+}{$Q+}{$V+}{$warnings on}

{
	ordenar 2 numeros
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program vars;

uses math;

procedure escrnum(n: integer);
begin
	write('el numero es ');
	write(n);
	writeln();
end;

var
	x: integer;
begin
	read(x);
	escrnum(x);
	escrnum(x ** 2);
end.
