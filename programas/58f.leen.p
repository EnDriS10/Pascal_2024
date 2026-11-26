{$mode objfpc}{$H-}{$R+}{$T+}{$I-}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Leer un numero del fichero
	fpc -g -oa.out $% && echo ahol | a.out
}

program leerint;

const
	MaxStr = 4;

type
	TipoStr = array [1..4] of char;

var
	entrada: text;	{ basicamente file of char }
	n: integer;
begin
	assign(entrada, 'datos');
	reset(entrada);
	read(entrada, n);
	writeln(n);
	close(entrada);
end.
