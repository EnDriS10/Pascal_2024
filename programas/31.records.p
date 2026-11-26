{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugando con records
	fpc -g -oa.out $% && echo Dom | a.out
}
program records;

type
	TipoEc = record
		a, b, c: real;
	end;

	TipoPalo = (Oros, Bastos, Copas, Espadas);
	TipoValor = 1..12;
	TipoCarta = record
		palo: TipoPalo;
		valor: TipoValor;
	end;

const
	EcPrueba: TipoEc = (
		a: 3.2;
		b: 4.8;
		c: 3.0;
	);

	AsBastos: TipoCarta = (
		palo: Bastos;
		valor: 1;
	);
	ReyBastos: TipoCarta = (
		palo: Bastos;
		valor: 12;
	);

var ec: Tipoec;

begin
	ec := EcPrueba;
	ec.a := 9.9;

	{ no podemos comparar, leer o escribir records }
	writeln(ec.a, ' ', ec.b, ' ', ec.c);

end.
