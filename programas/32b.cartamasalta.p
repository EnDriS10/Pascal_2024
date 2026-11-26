{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir la carta mas alta a las 7 y 1/2
	fpc -g -oa.out $% && echo 3 bastos 2 copas | a.out
}
program cartamasalta;

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

var c1, c2: TipoCarta;

begin
	leercarta(c1);
	leercarta(c2);
	if valorcarta(c1) > valorcarta(c2) then begin
		escrcarta(c1);
	end
	else begin
		escrcarta(c2);
	end;
end.
