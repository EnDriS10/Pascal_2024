{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Palindromos

	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program pal;

const
	MaxStr = 20;
type
	TipoStr = string[MaxStr];

procedure invertir(var s: TipoStr);
var
	i: integer;
	aux: char;
begin
	for i := 1 to length(s) div 2 do begin
		aux := s[i];
		s[i] := s[length(s)-i+1];
		s[length(s)-i+1] := aux;
	end;
end;

function espalindromo(s: TipoStr): boolean;
	var inversa: TipoStr;
begin
	inversa := s;
	invertir(inversa);
	result := s = inversa;
end;

begin
	writeln(espalindromo('abcdef'));
	writeln(espalindromo('abcba'));
end.
