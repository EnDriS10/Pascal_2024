{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Sumar notas
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program sumar;

const
	NumNotas = 3;	{ lamentablemente, no funciona :integer = 3 }

type
	TipoIndNotas = 1..NumNotas;
	TipoNotas = array[TipoIndNotas] of real;

function sumarnotas(notas: TipoNotas): real;
var
	suma: real;
	i: integer;
begin
	suma := 0.0;
	for i := 1 to NumNotas do begin
		suma := suma + notas[i];
	end;
	result := suma;
end;

const
	NotasPrueba: TipoNotas = (4.0, 3.0, 7.0);
begin
	writeln(sumarnotas(NotasPrueba) :0:2);
end.
