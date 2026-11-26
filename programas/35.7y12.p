{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugar a las 7 y 1/2
	fpc -g -oa.out $% && echo 1 bastos 8 copas | a.out
}
program sieteymedia;

type
	TipoPalo = (Oros, Bastos, Copas, Espadas);
	TipoValor = 1..12;
	TipoCarta = record
		palo: TipoPalo;
		valor: TipoValor;
	end;


procedure leercarta(var c: TipoCarta);
begin
	read(c.valor);
	read(c.palo);
end;

procedure escrcarta(c: TipoCarta);
begin
	writeln(c.valor, ' de ', c.palo);
end;

function valorcarta(c: TipoCarta): real;
begin
	if c.valor >= 10 then begin
		result := 0.5;
	end
	else begin
		result := c.valor
	end;
end;

var
	c: TipoCarta;
	puntos: real;
begin
	puntos := 0.0;
	while puntos < 7.5 do begin
		leercarta(c);
		puntos := puntos + valorcarta(c);
		escrcarta(c);
		writeln('puntos = ', puntos:0:2);
	end;
	if puntos > 7.5 then begin
		writeln('has perdido');
	end
	else begin
		writeln('has ganado');
	end;
end.
