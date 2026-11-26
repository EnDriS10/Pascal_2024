{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	leer dos puntos y escribirlos ordenados por distancia a Origen
	fpc -g -oa.out $% && echo 3 5 | a.out
}
program ordpt;

const
	Orig: integer = 0;

procedure leerpunto(var p: integer);
begin
	write('punto? ');
	read(p);
end;

function distancia(p1, p2: integer): integer;
begin
	if p1 > p2 then begin
		result := p1 - p2;
	end
	else begin
		result := p2 - p1;
	end;
end;

procedure escrdistpunto(p: integer);
begin
	writeln('punto = ', p, ' dist = ', distancia(p, Orig));
end;

procedure intercambiar(var p1, p2: integer);
var
	aux: integer;
begin
	aux := p1;
	p1 := p2;
	p2 := aux;
end;

procedure ordenarpordist(var p1, p2: integer);
begin
	if distancia(p1, Orig) > distancia(p2, Orig) then begin
		intercambiar(p1, p2);
	end;
end;

var
	pt1, pt2: integer;
begin
	leerpunto(pt1);
	leerpunto(pt2);
	ordenarpordist(pt1, pt2);
	escrdistpunto(pt1);
	escrdistpunto(pt2);
end.
