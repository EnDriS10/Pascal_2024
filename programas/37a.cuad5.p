{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program cuadrados5;

const
	N: integer = 5;
var
	i: integer;

begin
	for i := 1 to 5 do begin;
		writeln(sqr(i));
	end;
end.
