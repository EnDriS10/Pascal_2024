{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Sumar y calcular la media de notas
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program sumar;

const
	NumNotas = 3;

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

function media(notas: TipoNotas): real;
begin
	result := sumarnotas(notas) / NumNotas;
end;

const
	NotasPrueba: TipoNotas = (4.0, 3.0, 7.0);
begin
	writeln(media(NotasPrueba) :0:2);
end.
