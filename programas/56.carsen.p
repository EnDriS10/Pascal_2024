{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Caracteres en linea

	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program carsen;

const
	MaxStr = 50;

type
	TipoStr = string[MaxStr];
	TipoCjto = array[char] of boolean;

function cjtovacio(): TipoCjto;
var
	c: char;
	cjto: TipoCjto;
begin
	for c := low(char) to high(char) do begin
		cjto[c] := false;
	end;
	result := cjto;
end;

function cjtocarsen(s: TipoStr): TipoCjto;
var
	cjto: TipoCjto;
	i: integer;
begin
	cjto := cjtovacio();
	for i := 1 to length(s) do begin
		cjto[s[i]] := true;
	end;
	result := cjto;
end;

procedure escrcjto(cjto: TipoCjto);
var
	c: char;
begin
	write('[');
	for c in char do begin
		if cjto[c] then begin
			write(c);
		end;
	end;
	writeln(']');
end;

var
	str: TipoStr;
	cjto: TipoCjto;
begin
	readln(str);
	cjto := cjtocarsen(str);
	escrcjto(cjto);
end.
