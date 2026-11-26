{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Cuadrados menores que 100
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program cuadrados;

const
	MaxCuad: integer = 100;

var
	num, cuad: integer;

begin
	num := 1;
	cuad := num * num;
	while cuad < MaxCuad do begin
		writeln(cuad);
		num := num + 1;
		cuad := num * num;
	end;
end.
