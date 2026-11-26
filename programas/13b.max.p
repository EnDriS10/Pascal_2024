{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	maximo

	fpc -g -oa.out $% && a.out
}
program max;

function maxint(n1, n2: integer): integer;
begin
	if n1 > n2 then begin
		result := n1;
	end
	else begin
		result := n1;
	end;
end;

begin
	writeln(maxint(3, 2));
end.
