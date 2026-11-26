
{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Tarea;

(* Programa de los primeros 2 incisos*)

var
	//para Cambio de letras 
	A: char;
	
	//Para los digitos y el valor del numero 
	B , C : char ;
	D : integer;

begin

	writeln('Introduce una letra');
	readln(A);

case A of
	'a'..'z' : writeln('Su mayuscula correspondiente es ' , chr( ord(A) - 32 ) );
	'A'..'Z' : writeln( 'Su minuscula correspondiente es ' ,chr( ord(A) + 32 ) );

otherwise
	writeln('Letra no soportada');

end;


	writeln('Introduzca un digito del 0-9');
	readln(B);
	writeln('Introduzca otro digito del 0-9');
	readln(C);
	
(* en el sistema decimal xy = 10x + y (forma de resolver el ejercicio)*)
(* se le resta ord('0') ya que los digitos 0-9 son 48-58 y ord('0') = 48:
un ejemplo;

1 es 49 al restarle ord('0') o sea 49-48=1
*)
	
	D := 10*( ord(B) - ord('0') ) + ( ord(C) - ord('0') );
	writeln('El valor del numero en el sistema en base 10 es ' , D);

end.
