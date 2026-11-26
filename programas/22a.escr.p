{$mode objfpc}{$H-}{$R+}{$Q+}{$V+}{$warnings on}
{
	escribir la suma de dos numeros
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program sumar;

procedure escrnum(n: integer);
begin
	write('el valor es ');
	write(n);
	writeln();
end;

var
	a, b: integer;
	suma: integer;
begin
	read(a);
	read(b);
	suma := a+b;
	escrnum(suma);
end.
