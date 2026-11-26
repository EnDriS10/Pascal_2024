{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugar con strings
	Flexibles, pero si sabemos lo que hacemos.

	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program strings;

type
	TipoCars = array[1..8] of char;
	TipoCars2 = array[1..18] of char;
	TipoString20 = string[20];
	TipoString5 = string[5];

const
	CarsPrueba: TipoCars = 'abcde';
var
	cars: TipoCars;
	cars2: TipoCars2;
	str20: TipoString20;
	str5: TipoString5;
	str: string;		{ string[255] }
begin
	str20 := 'hola caracola';
	writeln(str20);
	str5 := str20;
	writeln(str5);
	str20 := str5;
	writeln(str20);

	str := 'hola';
	str[0] := 'b';
	writeln(str);
	str[1] := 'b';
	writeln(str);

	cars := 'hi';
	writeln(cars);
	cars[1] := 'x';
	writeln(cars);

	str20 := 'hola caracola';
	writeln(length(str20));
	cars := str20;
	writeln(cars);
	{ Pero cars2 := cars no vale! incompatibles, no string}

	if 'abc' < 'ab' then begin
		writeln('menor');
	end;

	writeln('abc' + 'def');
end.
