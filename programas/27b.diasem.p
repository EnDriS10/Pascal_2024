{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Dias de la semana
	fpc -g -oa.out $% && echo Vie | a.out
}
program diasem;

type
	TipoDiaSem = (Lun, Mar, Mie, Jue, Vie, Sab, Dom);
	TipoDiaLab = Lun..Sab;

const
	Fiesta: TipoDiaSem = Dom;
var
	dia1, dia2: TipoDiaSem;
	dialab: TipoDiaLab;
begin
	writeln(ord(Mie));
	writeln(TipoDiaSem(5));
	dia1 := Lun;
	dia2 := Fiesta;
	writeln('dia1=', dia1);
	writeln('dia2=', dia2);
	readln(dia1);
	dia1 := succ(dia1);
	writeln('succ dia1=', dia1);

	dialab := dia1;
	writeln('dialab=', dialab);
	dia1 := dialab;
	writeln('succ dia1=', succ(dia1));
	writeln('succ dialab=', succ(dialab));
	dialab := succ(dia1);
	writeln('dialab=', dialab);
end.
