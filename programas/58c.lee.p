{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Leer un saludo del fichero
	fpc -g -oa.out $% && echo ahol | a.out
}

program leerlinea;

const
	MaxStr = 4;

type
	TipoStr = string[MaxStr];

var
	entrada: text;	{ basicamente file of char }
	linea: TipoStr;
begin
	assign(entrada, 'texto');
	reset(entrada);
	read(entrada, linea);
	close(entrada);
	writeln('[', linea, ']');
end.
