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

function espalindromo(s: TipoStr): boolean;
var
	i: integer;
	loes: boolean;
begin
	loes := true;
	i := 1;
	while (i < length(s) div 2) and loes do begin
		if s[i] <> s[length(s)-i+1] then begin
			loes := false;
		end
		else begin
			i := i + 1;
		end;
	end;
	result := loes;
end;

begin
	writeln(espalindromo('abcdef'));
	writeln(espalindromo('abcba'));
end.
