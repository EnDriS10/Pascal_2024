{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	cuadrados
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program cuads;
uses math;	{ para usar ** }
var
	n: integer;
begin
	read(n);
	writeln(n ** 2);
	read(n);
	writeln(n ** 2);
end.
