{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir palabra mas repetida

	fpc -g -oa.out $% &&  a.out<$%
}

program maxreps;

const
	LongStr = 80;
	LongCjto = 512;
	Tab: char = '	';

type
	TipoStr = record
		cars: string[LongStr];
		ncars: integer;
	end;

	TipoRep = record
		pal: TipoStr;
		nveces: integer;
	end;

	TipoCjtoReps = record
		reps: array[1..LongCjto] of TipoRep;
		nreps: integer;
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

function longitudstr(str: TipoStr): integer;
begin
	result := str.ncars;
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

function igualstr(str1, str2: TipoStr): boolean;
var
	i: integer;
	igual: boolean;
begin
	if longitudstr(str1) <> longitudstr(str2) then begin
		result := false;
	end
	else begin
		igual := true;
		i := 1;
		while (i <= longitudstr(str1)) and igual do begin
			if str1.cars[i] <> str2.cars[i] then begin
				igual := false;
			end
			else begin
				i := i + 1;
			end;
		end;
		result := igual;
	end;
end;

procedure escrstrln(str: TipoStr);
begin
	escrstr(str);
	writeln();
end;

procedure vaciarreps(var cjto: TipoCjtoReps);
begin
	cjto.nreps := 0;
end;

procedure incrrep(var rep: TipoRep);
begin
	rep.nveces := rep.nveces + 1;
end;

procedure nuevarep(var cjto: TipoCjtoReps; pal: TipoStr);
begin
	if cjto.nreps = LongCjto then begin
		fatal('conjunto demasiado largo');
	end;
	cjto.nreps := cjto.nreps + 1;
	cjto.reps[cjto.nreps].pal := pal;
	cjto.reps[cjto.nreps].nveces := 1;
end;

procedure insrep(var cjto: TipoCjtoReps; pal: TipoStr);
var
	i: integer;
	encontrado: boolean;
begin
	i := 1;
	encontrado := false;
	while (i <= cjto.nreps) and not encontrado do begin
		if igualstr(cjto.reps[i].pal, pal) then begin
			incrrep(cjto.reps[i]);
			encontrado := true;
		end
		else begin
			i := i + 1;
		end;
	end;
	if not encontrado then begin
		nuevarep(cjto, pal);
	end;
end;

function maxrep(var cjto: TipoCjtoReps): TipoStr;
var
	i: integer;
	cual: TipoRep;
begin
	vaciarstr(cual.pal);
	cual.nveces := 0;
	for i := 1 to cjto.nreps do begin
		if cjto.reps[i].nveces > cual.nveces then begin
			cual := cjto.reps[i];
		end;
	end;
	result := cual.pal;
end;

var
	str: TipoStr;
	reps: TipoCjtoReps;
begin
	vaciarreps(reps);
	while not eof() do begin
		leerstr(input, str);
		if longitudstr(str) > 0 then begin
			insrep(reps, str);
		end;
	end;
	str := maxrep(reps);
	if longitudstr(str) = 0 then begin
		writeln('ninguna');
	end
	else begin
		escrstrln(str);
	end;
end.
