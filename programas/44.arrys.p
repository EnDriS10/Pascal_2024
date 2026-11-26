{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugando con arrays
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program arrys;

const
	NumNotas = 4;	{ lamentablemente, no funciona :integer = 3 }

type
	TipoIndNotas = 1..NumNotas;
	TipoNotas = array[TipoIndNotas] of real;

	TipoNumeros = array[1..4] of integer;

	{ en Pascal existe set of char; no lo usaremos }
	TipoConjuntoLetras = array[char] of boolean;

	TipoQueTal = (MuyMal, Mal, Regu, Bien, MuyBien);
	TipoDiaSem = (Lun, Mar, Mier, Jue, Vie, Sab, Dom);

	TipoQueTalSem = array[TipoDiaSem] of TipoQueTal;

const
	BuenasNotas: TipoNotas = (10.0, 10.0, 10.0, 4.0);
var
	sem: TipoQueTalSem;
	dia: TipoDiaSem;
	notas: TipoNotas;
	cjto: TipoConjuntoLetras;
	i: integer;
begin
	notas := BuenasNotas;
	{ no se puede leer, escribir, comparar }

	notas[1] := 3.5;
	cjto['a'] := true;
	if cjto['a'] then begin
		writeln('a esta');
	end;

	for i := 1 to NumNotas do begin
		notas[i] := 10.0;
	end;

	for i := low(notas) to high(notas) do begin
		notas[i] := 10.0;
	end;

	notas[i+1] := 5.4;	{ error }

	for dia := Lun to Dom do begin
		writeln('el ', dia, ' ha ido ', sem[dia]);
	end;
	for dia in TipoDiaSem do begin
		writeln('el ', dia, ' ha ido ', sem[dia]);
	end;
	for dia := low(sem) to high(sem) do begin
		writeln('el ', dia, ' ha ido ', sem[dia]);
	end;
	for dia := low(TipoDiaSem) to high(TipoDiaSem) do begin
		writeln('el ', dia, ' ha ido ', sem[dia]);
	end;
	for dia := low(TipoQueTalSem) to high(TipoQueTalSem) do begin
		writeln('el ', dia, ' ha ido ', sem[dia]);
	end;
end.
