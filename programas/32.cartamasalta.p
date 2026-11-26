{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir la carta mas alta, ignorando el palo.
	fpc -g -oa.out $% && echo Dom | a.out
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

var c1, c2: TipoCarta;

begin
	leercarta(c1);
	leercarta(c2);
	if c1.valor > c2.valor then begin
		escrcarta(c1);
	end
	else begin
		escrcarta(c2);
	end;
end.
