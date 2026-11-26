{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Resolver ecuacion de 2 grado
	fpc -g -oa.out $% && echo 5 38  7 | a.out
}
program ec2;

    ...

var
	a, b, c: real;	{ ax2+xb+c=0 }
	x1, x2: real;
begin
	leerec(a, b, c);
	if tienesol(a, b, c) then begin
		solucionarec(a, b, c, x1, x2);
		escrsol(a, b, c, x1, x2);
	end
	else begin
		writeln('sin solucion');
	end;
end.
