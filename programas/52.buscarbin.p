{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Busqueda binaria
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program buscarbin;
const
	NumCars = 5;

type
	TipoCars = array[1..NumCars] of char;


procedure buscarbin(cars: TipoCars; car: char;
		var pos: integer; var esta: boolean);
var
	izq, der: integer;
begin
	izq := 1;
	der := NumCars;
	esta := false;
	while (izq <= der) and not esta do begin
		pos := (izq+der) div 2;
		if cars[pos] = car then begin
			esta := true;
		end
		else if cars[pos] > car then begin
			der := pos-1;
		end
		else begin
			izq := pos+1;
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
	buscarbin(CarsPrueba, 'c', pos, esta);
	if not esta then begin
		writeln('no esta');
	end
	else begin
		writeln('c esta en pos ', pos);
	end;

	buscarbin(CarsPrueba, 'x', pos, esta);
	if not esta then begin
		writeln('no esta');
	end
	else begin
		writeln('c esta en pos ', pos);
	end;
end.
