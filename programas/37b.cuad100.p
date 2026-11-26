{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Cuadrados de numeros menores que 100
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program cuadrados;

const
	MaxCuad: integer = 100;

var
	num, cuad: integer;

begin
	num := 1;
	repeat
		cuad := num * num;
		if cuad < MaxCuad then begin
			writeln(cuad);
		end;
		num := num + 1;
	until cuad >= MaxCuad;
end.
