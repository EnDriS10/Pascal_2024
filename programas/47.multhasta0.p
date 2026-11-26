{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Multiplicar hasta leer un 0
	fpc -g -oa.out $% && echo 8.0 10.2 11.1 2.3 0.0 | a.out
}

program mult;

var
	prod, num: real;
begin
	prod := 1.0;
	repeat
		read(num);
		if num <> 0.0 then begin
			prod := prod + num;
		end;
	until num = 0.0;
	writeln(prod :0:2);
end.
