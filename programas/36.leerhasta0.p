{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Leer numeros hasta 0
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program hasta0;

var
	n: integer;
begin
	repeat
		read(n);
		writeln(n);
	until n = 0;
end.
