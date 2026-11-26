{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Caracteres en linea

	fpc -g -oa.out $% && echo ahol | a.out
}

program carsen;

const
	MaxStr = 50;
	LongCjto = 50;

type
	TipoStr = string[MaxStr];
	TipoIndCars = 1..LongCjto;
	TipoCars = array[TipoIndCars] of char;
	TipoCjto = record
		cars: TipoCars;
		ncars: integer;
	end;

procedure fatal(msg: string);
begin
	writeln('error fatal: ', msg);
	halt(1);
end;

procedure vaciarcjto(var cjto: TipoCjto);
begin
	cjto.ncars := 0;
end;

{ var por eficiencia, no hacemos una copia }
function estaencjto(var cjto: TipoCjto; c: char): boolean;
var
	i: integer;
	encontrado: boolean;
begin
	i := 1;
	encontrado := false;
	while (i <= cjto.ncars) and not encontrado do begin
		if cjto.cars[i] = c then begin
			encontrado := true;
		end
		else begin
			i := i + 1;
		end;
	end;
	result := encontrado;
end;
	
procedure inscjto(var cjto: TipoCjto; c: char);
begin
	if not estaencjto(cjto, c) then begin
		if cjto.ncars = LongCjto then begin
			fatal('conjunto demasiado largo');
		end;
		cjto.ncars := cjto.ncars + 1;
		cjto.cars[cjto.ncars] := c;
	end;
end;

{ var por eficiencia }
procedure escrcjto(var cjto: TipoCjto);
var
	i: integer;
begin
	write('[');
	for i := 1 to cjto.ncars do begin
		write(cjto.cars[i]);
	end;
	writeln(']');
end;

function cjtocarsen(s: TipoStr): TipoCjto;
var
	cjto: TipoCjto;
	i: integer;
begin
	vaciarcjto(cjto);
	for i := 1 to length(s) do begin
		inscjto(cjto, s[i]);
	end;
	result := cjto;
end;

var
	str: TipoStr;
	cjto: TipoCjto;
begin
	readln(str);
	cjto := cjtocarsen(str);
	escrcjto(cjto);
end.
