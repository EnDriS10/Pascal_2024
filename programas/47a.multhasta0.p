{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Multiplicar hasta leer un 0
	fpc -g -oa.out $% && echo 8.0 10.2 11.1 2.3 0.0 | a.out
}

program mult;

var
	num: real;
begin
	repeat
		read(num);
		if num <> 0.0 then begin
			writeln(num :0:2);
		end;
	until num = 0.0;
end.
