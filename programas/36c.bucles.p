{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugar con bucles
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program bucles;

type
	TipoLetras = 'a'..'e';
	TipoColor = (Rojo, Verde, Azul);
var
	c: char;
	col: TipoColor;

begin
	for c := 'a' to 'e' do begin
		writeln(c);
	end;
	for c in TipoLetras do begin
		writeln(c);
	end;
	for col in TipoColor do begin
		writeln(col);
		{ esto es ilegal: col := Rojo; }
	end;
	for col := low(TipoColor) to high(TipoColor) do begin
		writeln(col);
	end;
	writeln(col);	{ muy mala idea }
end.
