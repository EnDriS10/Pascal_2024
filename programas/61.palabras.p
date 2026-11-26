{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Leer palabras

	fpc -g -oa.out $% &&  a.out<guide
}

program palabras;

const
	LongStr = 50;
	Tab: char = '	';

type
	TipoStr = record
		cars: string[LongStr];
		ncars: integer;
	end;

procedure fatal(msg: string);
begin
	writeln('error fatal: ', msg);
	halt(1);
end;

function esblanco(c: char): boolean;
begin
	result := (c = ' ') or (c = Tab);
end;

procedure vaciarstr(var str: TipoStr);
begin
	str.ncars := 0;
end;

procedure appcar(var str: TipoStr; c: char);
begin
	if str.ncars = LongStr then begin
		fatal('appcar: demasiados');
	end;
	str.ncars := str.ncars + 1;
	str.cars[str.ncars] := c;
end;


procedure leerstr(var entrada: Text; var str: TipoStr);
var
	c: char;
begin
	vaciarstr(str);
	while not eof(entrada) and not eoln(entrada)
			and not esblanco(entrada^) do begin
		read(entrada, c);
		appcar(str, c);
	end;
end;

procedure escrstr(str: TipoStr);
var
	i: integer;
begin
	for i := 1 to str.ncars do begin
		write(str.cars[i]);
	end;
end;

procedure escrstrln(str: TipoStr);
begin
	escrstr(str);
	writeln();
end;

var
	str: TipoStr;
begin
	leerstr(input, str);
	escrstrln(str);
end.
