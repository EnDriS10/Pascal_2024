{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	saludar al numero pi
	fpc -g -oa.out $% && a.out
}
program holapi;
const
	Pi: real = 3.14;
begin
	writeln('hola ', Pi:0:2, '!');
end.
