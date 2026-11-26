{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Programa de bienvenida en Pascal.
	Autor: aturing

	-- la primera linea son directivas para el compilador:
		$mode objfpc: object pascal
		$H-:
		$R+: range checking on
		$T+: typed address operator on
		$Q+:
		$V+: var-string checking on
		$D+: debug on
		$X-: extended syntax off
		$warnings on: issue warnings on
	-- en windows puede ayudar: $apptype console

	fpc -g -oa.out $% && a.out
	rm -f *.o a.out
}

{nombre del programa}
program programa;

{utilidades o librerias que usamos}
uses math;

{tipos de datos}
type
	{ dias de la semana }
	TipoDiaSem = (Lun, Mar, Mier, Jue, Vie, Sab, Dom);

{constantes}
const
	Pi: real = 3.14;	{ expresion solo puede usar contantes }

{funciones y procedimientos}

function longitudcirculo(r: real): real;
begin
	longitudcirculo := 2.0 * Pi * r;	{retornar 2*Pi*r}
end;

{constantes de prueba}
const
	RadioPrueba = 2.0;

{variables del programa principal}
var
	nombre: string = 'Mr. smith';

{programa principal}
begin
	writeln(longitudcirculo(RadioPrueba));
	writeln('Hola que tal. ', nombre);
end.
