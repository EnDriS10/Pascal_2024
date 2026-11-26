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

function esbisiesto(anyo: integer): boolean;
begin
	result := (Anyo mod 4 = 0) and (Anyo mod 100 <> 0) or
		(Anyo mod 400 = 0);
end;

function diasenmes(anyo, mes: integer): integer;
begin
	case mes of
	1, 3, 5, 7, 8, 10, 12:
		result := 31;
	2:
		if esbisiesto(anyo) then begin
			result := 29
		end
		else begin
			result := 28;
		end;
	otherwise
		result := 30;
	end;
end;

function diaok(anyo, mes, dia: integer): boolean;
begin
	result := (dia >= 1) and (dia <= diasenmes(anyo, mes));
end;

function fechaok(anyo, mes, dia: integer): boolean;
begin
	result := anyook(anyo) and
			mesok(mes) and diaok(anyo, mes, dia);
end;

const
	Anyo: integer = 2001;
	Mes: integer = 11;
	Dia: integer = 16;

begin
	writeln(fechaok(Anyo, Mes, Dia));
end.
