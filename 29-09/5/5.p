{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Factorial;

var
	A,B : longint; //se usa para numeros enteros de mayor longitud
	C: integer;
	
	//Definimos tres numeros
	
begin

	writeln('Escriba un numero Entero');
	readln(A);  // se introduce el numero al que quieres saber el factorial
	B := 1;
	C := 1;
	
	repeat
		B := B * C;	// se define B como la multiplicacion de B desde B=1 y C=1
		C := C + 1;	// se repite el proceso usando los sucesores de C
	until
		C > A;		//el proceso termina cuando C se iguala a A
	
	writeln( A, '! = ', B);

end.
	

