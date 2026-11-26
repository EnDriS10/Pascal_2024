{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	punto mas distante a un origen

	fpc -g -oa.out $% && a.out
}
program distancias;

const
	Origen: integer = 0;

function distancia(p1, p2: integer): integer;
begin
	if p1 > p2 then begin
		result := p1-p2;
	end
	else begin
		result := p2-p1;
	end;
end;

function masdistante(a, b: integer): integer;
begin
	if distancia(Origen, a) > distancia(Origen, b) then begin
		result := a;
	end
	else begin
		result := b;
	end;
end;

const
	P1: integer = 3;
	P2: integer = -2;

begin
	writeln(masdistante(P1, P2));
end.
	