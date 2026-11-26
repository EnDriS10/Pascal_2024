{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Buscar en secuencia ordenada
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program buscarord;
const
	NumCars = 5;

type
	TipoCars = array[1..NumCars] of char;


procedure buscarcar(cars: TipoCars; car: char;
		var pos: integer; var esta: boolean);
var
	puedeestar: boolean;
begin
	puedeestar := true;
	esta := false;
	pos := 1;
	while (pos <= NumCars) and not esta and puedeestar do begin
		if cars[pos] = car then begin
			esta := true;
		end
		else if cars[pos] > car then begin
			puedeestar := false;
		end
		else begin
			pos := pos+1;
		end;
	end;
end;

{ writeln(cars); }

const
	CarsPrueba: TipoCars = 'abcde';
var
	pos: integer;
	esta: boolean;
begin
	buscarcar(CarsPrueba, 'c', pos, esta);
	if not esta then begin
		writeln('no esta');
	end
	else begin
		writeln('c esta en pos ', pos);
	end;

	buscarcar(CarsPrueba, 'x', pos, esta);
	if not esta then begin
		writeln('no esta');
	end
	else begin
		writeln('c esta en pos ', pos);
	end;
end.
