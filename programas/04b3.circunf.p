{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	caular longitud de circunferencia de radio r
	fpc -g -oa.out $% && a.out
}
program longcircunf;

const
	Pi: real = 3.1415926;
	R: real = 3.0;
begin
	writeln(2*Pi*R);
end.
