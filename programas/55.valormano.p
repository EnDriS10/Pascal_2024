{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Valor de mano a las 7y1/2

	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program valormano;

const
	LongMano = 3;

type
	TipoPalo = (Oros, Bastos, Copas, Espadas);
	TipoValor = 1..12;
	TipoCarta = record
		palo: TipoPalo;
		valor: TipoValor;
	end;

	TipoMano = array[1..LongMano] of TipoCarta;

function valorcarta(c: TipoCarta): real;
begin
	if c.valor >= 10 then begin
		result := 0.5;
	end
	else begin
		result := c.valor;
	end;
end;

function valormano(m: TipoMano): real;
var
	i: integer;
	valor: real;
begin
	valor := 0.0;
	for i := 1 to LongMano do begin
		valor := valor + valorcarta(m[i]);
	end;
	result := valor;
end;

const
	ManoPrueba: TipoMano = (
		(palo: Oros; valor: 3),
		(palo: Bastos; valor: 1),
		(palo: Copas; valor: 11)
	);
begin
	writeln(valormano(ManoPrueba) :0:2);
end.
