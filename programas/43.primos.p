{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Escribir primeros primos
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program primos;

const
	NumPrimos: integer = 10;

function esprimo(n: integer): boolean;
var
	i: integer;
	loes: boolean;
begin
	loes := true;
	i := 2;
	while (i < n) and loes do begin
		if n mod i = 0 then begin
			loes := false;
		end
		else begin
			i := i + 1;
		end;
	end;
	result := loes;
end;

var
	cuantos, n: integer;
begin
	cuantos := 0;
	n := 1;
	repeat
		if esprimo(n) then begin
			writeln(n);
			cuantos := cuantos + 1;
		end;
		n := n + 1;
	until cuantos = NumPrimos;
end.
