{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	jugar con variables
	fpc -g -oa.out $% && echo 3 | a.out
}
program vars;

uses math;

var
	c: char;
begin
	c := 'X';
	writeln(succ(c));
	c := pred(c);
	writeln(c);
end.
