program sigdia;

type
	TipoDiaSem = (Lun, Mar, Mie, Jue, Vie, Sab, Dom);
var
	dia: TipoDiaSem;
begin
	readln(dia);
	dia := succ(dia);
	writeln(dia);
end.
