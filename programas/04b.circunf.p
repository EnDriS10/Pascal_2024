{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	longitud circunferencia
	fpc -g -oa.out $% && a.out
}
program longcircunf;

const
	R: real = 45.0;
begin
	writeln(2*Pi*R);
end.
