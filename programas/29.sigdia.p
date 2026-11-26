{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Siguiente dia al leido
	fpc -g -oa.out $% && echo Dom | a.out
}
program sigdia;

type
	TipoDiaSem = (Lun, Mar, Mie, Jue, Vie, Sab, Dom);

function sigdia(d: TipoDiaSem): TipoDiaSem;
begin
	if d = Dom then begin
		result := Lun;
	end
	else begin
		result := succ(d);
	end;
end;

var
	dia: TipoDiaSem;
begin
	readln(dia);
	writeln(sigdia(dia));
end.
