{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	comparar reales
	fpc -g -oa.out $% && a.out
}
program compara;


const
	A: real =  100.0 / 27.0;
begin
	writeln('Comparacion mal: ', A*27.0 = 100.0);
end.
