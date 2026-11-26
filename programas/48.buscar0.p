{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Buscarn un 0
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program buscar0;

const
	NumNums = 4;	{ lamentablemente, no funciona :integer = 3 }

type
	TipoIndNums = 1..NumNums;
	TipoNums = array[TipoIndNums] of integer;

procedure buscarnum(nums: TipoNums; n: integer;
		var pos: integer; var encontrado: boolean);
begin
	encontrado := false;
	pos := 1;
	while (pos <= NumNums) and not encontrado do begin
		if nums[pos] = n then begin
			encontrado := true;
		end
		else begin
			pos := pos + 1;
		end;
	end;
end;

const
	NumsPrueba: TipoNums = (4, 3, 0, 7);
	Busco: integer = 0;
var
	pos: integer;
	esta: boolean;
begin
	buscarnum(NumsPrueba, Busco, pos, esta);
	if not esta then begin
		writeln('no encontrado');
	end
	else begin
		writeln(Busco, ' encontrado en pos ', pos);
	end;
end.
