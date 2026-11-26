{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	comparar reales
	fpc -g -oa.out $% && a.out
}
program compara;

const
	Eps: real = 0.000005;

function igualreal(a: real; b: real): boolean;
begin
	igualreal := abs(a-b) < Eps;
end;

const
	A: real =  100.0 / 27.0;
begin
	writeln('Comparacion mal: ', A*27.0 = 100.0);
	writeln('Comparacion bien: ', igualreal(A*27.0, 100.0));
end.
