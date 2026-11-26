{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	jugar con variables
	fpc -g -oa.out $% && echo 3 | a.out
}
program vars;

var
	n: integer;
begin
	read(n);
	writeln(sqr(n));
end.
