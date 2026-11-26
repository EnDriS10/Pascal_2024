{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Matriz
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program matriz;

const
	DimX: integer = 4;
	DimY: integer = 5;

var
	i, j: integer;

begin
	for i := 1 to DimX do begin
		for j := 1 to DimY do begin
			write(' [',i,',',j,']');
		end;
		writeln();
	end;
end.
