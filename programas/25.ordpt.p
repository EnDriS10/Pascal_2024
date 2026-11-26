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
	readln(p);
end;

procedure escrpunto(p: integer);
begin
	writeln('punto = ', p);
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
	p1, p2: integer;
begin
	leerpunto(p1);
	leerpunto(p2);
	ordenarpordist(p1, p2);
	escrpunto(p1);
	escrpunto(p2);
end.
