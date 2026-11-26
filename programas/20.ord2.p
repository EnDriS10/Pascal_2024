{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	ordenar 2 numeros
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program vars;

uses math;

var
	n1, n2: integer;
begin
	read(n1);
	read(n2);
	if n1 > n2 then begin
		writeln(n2);
		writeln(n1);
	end
	else begin
		writeln(n1);
		writeln(n2);
	end;
end.
