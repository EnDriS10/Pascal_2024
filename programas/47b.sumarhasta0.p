{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Sumar hasta leer un 0
	fpc -g -oa.out $% && echo 8.0 10.2 11.1 2.3 0.0 | a.out
}

program sumar;

const
	Eps: real = 0.000001;
var
	suma, num: real;
begin
	suma := 0.0;
	repeat
		read(num);
		if num <> 0.0 then begin
			suma := suma + num;
		end;
	until abs(num) < Eps;
	writeln(suma :0:2);
end.
