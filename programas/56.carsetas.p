{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Caracteres en linea con conjunto ordenado

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
procedure buscarencjto(var cjto: TipoCjto; c: char;
	var pos: integer; var encontrado: boolean);
var
	puedeestar: boolean;
begin
	pos := 1;
	encontrado := false;
	puedeestar := true;
	while (pos <= cjto.ncars) and not encontrado and puedeestar do begin
		if cjto.cars[pos] = c then begin
			encontrado := true;
		end
		else if cjto.cars[pos] > c then begin
			puedeestar := false;
		end
		else begin
			pos := pos + 1;
		end;
	end;
end;

{ var por eficiencia, no hacemos una copia }
function estaencjto(var cjto: TipoCjto; c: char): boolean;
var
	pos: integer;
	encontrado: boolean;
begin
	buscarencjto(cjto, c, pos, encontrado);
	result := encontrado;
end;
	
procedure inscjto(var cjto: TipoCjto; c: char);
var
	pos, i: integer;
	encontrado: boolean;
begin
	buscarencjto(cjto, c, pos, encontrado);
	if not encontrado then begin
		if cjto.ncars = LongCjto then begin
			fatal('conjunto demasiado largo');
		end;
		for i := cjto.ncars downto pos do begin
			cjto.cars[i+1] := cjto.cars[i];
		end;
		cjto.cars[pos] := c;
		cjto.ncars := cjto.ncars + 1;
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
