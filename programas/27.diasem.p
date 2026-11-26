{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Dias de la semana
	fpc -g -oa.out $% && echo Lun | a.out
}
program diasem;

type
	TipoDiaSem = (Lun, Mar, Mie, Jue, Vie, Sab, Dom);

const
	Fiesta: TipoDiaSem = Dom;
var
	dia1, dia2: TipoDiaSem;
begin
	dia1 := Lun;
	dia2 := Fiesta;
	writeln(dia1);
	writeln(dia2);
	readln(dia1);
	dia1 := succ(dia1);
	writeln(dia1);
end.
