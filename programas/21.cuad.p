{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	cuadrados
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program cuads;
uses math;	{ para usar ** }

{ leer un entero y escribir su cuadrado }
procedure escrcuadrado();
var
	n: integer;
begin
	read(n);
	writeln(n ** 2);
end;

begin
	escrcuadrado();
	escrcuadrado();
end.
