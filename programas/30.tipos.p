{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugando con tipos simples
	fpc -g -oa.out $% && echo Dom | a.out
}
program tipos;

type
	TipoEdad = 0..high(Integer);

var
	edad1: TipoEdad;
	numpersonas: integer;
begin
	numpersonas := 4;
	edad1 := 8;
	writeln(edad1);
	writeln(edad1 + 8);
	writeln(edad1 + numpersonas);	{ no es buena idea }
	writeln(edad1 - 1000);
	edad1 := edad1 - 1000;

end.
