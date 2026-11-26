{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Ordenar
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}
program ordenar;
const
	NumCars = 5;

type
	TipoCars = array[1..NumCars] of char;


procedure intercambiar(var c1, c2: char);
var
	aux: char;
begin
	aux := c1;
	c1 := c2;
	c2 := aux;
end;

function posmindesde(cars: TipoCars; pos: integer): integer;
var
	posmin, i: integer;
begin
	posmin := pos;
	for i := pos+1 to NumCars do begin
		if cars[posmin] > cars[i] then begin
			posmin := i;
		end;
	end;
	result := posmin;
end;

procedure sort(var cars: TipoCars);
var
	i, posmin: integer;
begin
	for i := 1 to NumCars-1 do begin
		posmin := posmindesde(cars, i);
		intercambiar(cars[i], cars[posmin]);
	end;
end;

{ writeln(cars); }
procedure escrcars(cars: TipoCars);
var
	i: integer;
begin
	for i := 1 to NumCars do begin
		write(cars[i]);
	end;
	writeln();
end;

const
	CarsPrueba: TipoCars = ('a', 'x', 'b', 'y', 'z');
var
	cars: TipoCars;
begin
	cars := CarsPrueba;
	sort(cars);
	escrcars(cars);
end.
