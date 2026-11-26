{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir palabra mas larga

	fpc -g -oa.out $% &&  a.out<guide
}

program maxstr;

const
	LongStr = 80;
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

function esblanco(c: char): boolean;
begin
	result := (c = ' ') or (c = Tab);
end;

procedure leerstr(var entrada: Text; var str: TipoStr);
var
	c: char;
	haypalabra: boolean;
begin
	vaciarstr(str);
	haypalabra := false;
	while not eof(entrada) and not haypalabra do begin
		if eoln(entrada) then begin
			readln(entrada);
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
	end;
	while haypalabra do begin
		appcar(str, c);
		if eof(entrada) or eoln(entrada) then begin
			haypalabra := false;
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
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
	max: TipoStr;
begin
	vaciarstr(max);
	while not eof() do begin
		leerstr(input, str);
		if str.ncars > max.ncars then begin
			max := str;
		end;
	end;
	if max.ncars = 0 then begin
		writeln('ninguna');
	end
	else begin
		escrstr(max);
		writeln();
	end;
end.
