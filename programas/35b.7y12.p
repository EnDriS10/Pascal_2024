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

function esfigura(c: TipoCarta): boolean;
begin
	result := c.valor >= 10;
end;

function valorcarta(c: TipoCarta): real;
begin
	if esfigura(c) then begin
		result := 0.5;
	end
	else begin
		result := c.valor
	end;
end;

var
	c: TipoCarta;
	valor: real;
begin
	leercarta(c);
	valor := valorcarta(c);
	writeln('puntos = ', valor:0:2);
end.
