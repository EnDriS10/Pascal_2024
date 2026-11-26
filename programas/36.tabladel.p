{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir la tabla del numero que leemos
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program tabladel;

procedure escrtabladel(n: integer);
var
	i: integer;
begin
	for i := 1 to 10 do begin
		writeln(n:2, ' x ', i:2, ' = ', n*i:2);
	end;
end;

var
	n: integer;
begin
	readln(n);
	escrtabladel(n);
end.
