{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	es valida una fecha?
	fpc -g -oa.out $% && a.out
}
program fechavalida;

const
	MinAnyo: integer = 1;
	MaxAnyo: integer = 3000;

	Ene: integer = 1;
	Dic: integer = 12;

function anyook(anyo: integer): boolean;
begin
	result := (anyo >= MinAnyo) and (anyo <= MaxAnyo);
end;

function mesok(mes: integer): boolean;
begin
	result := (mes >= Ene) and (mes <= Dic);
end;


function diaok(dia: integer): boolean;
begin
	result := True;
end;

function fechaok(anyo, mes, dia: integer): boolean;
begin
	result := anyook(anyo) and mesok(mes) and diaok(dia);
end;

const
	Anyo: integer = 2001;
	Mes: integer = 11;
	Dia: integer = 16;

begin
	writeln(fechaok(Anyo, Mes, Dia));
end.
