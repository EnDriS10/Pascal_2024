{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	leer un numero
	fpc -g -oa.out $% && { echo 3 | a.out }
}
program rdnum;

var
	n: integer;
begin
	write('tu numero? ');
	readln(n);
	writeln(n);
	n := 5;
	writeln(n);
end.
