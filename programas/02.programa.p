{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	Programa de bienvenida en Pascal.
	Autor: aturing
	fpc -g -oa.out $% && a.out
}

{nombre del programa}
program programa;

{utilidades o librerias que usamos}
uses math;

{constantes universales}
const
	Pi: real = 3.14;	{ expresion solo puede usar contantes }

{tipos de datos}
type
	{ dias de la semana }
	TipoDiaSem = (Lun, Mar, Mier, Jue, Vie, Sab, Dom);

{funciones y procedimientos}

function longitudcirculo(r: real): real;
begin
	result := 2.0 * Pi * r;	{retornar 2*Pi*r}
end;

{constantes de prueba}
const
	RadioPrueba: real = 2.0;

{variables del programa principal}
var
	nombre: string = 'Mr. smith';

{programa principal}
begin
	writeln(longitudcirculo(RadioPrueba));
	writeln('Hola que tal. ', nombre);
end.
