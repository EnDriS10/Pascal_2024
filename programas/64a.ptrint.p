{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Usar un puntero.
	fpc -g -oa.out $% &&   a.out <guide
}

program ptrint;

type
	TipoPtrInt = ^integer;

var
	pint: TipoPtrInt;
begin
	new(pint);
	pint^ := 3;
	writeln(pint^);
	dispose(pint);
end.
