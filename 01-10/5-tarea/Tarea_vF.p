{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

uses math; // esto es porque en el punto final tengo que usar un sqrt

const

	Pi: real = 3.1416;
	

//funciones usadas en el programa
	function Area1(A,B : real) : real;
	begin
		result := A * B;
	end; // La funcion Area1 calcula area de un rectangulo

	function Volumen(A : real) : real;
	begin
		result := 4/3 * Pi * A * A * A;
	end; //La funcion Volumen calcula el volumen de una esfera
	
	function Area2(A : real) : real;
	begin
		result := Pi * A * A;
	end; // La funcion Area2 calcula el area de un circulo

	function Discriminante(A , B, C : real) : real;
	begin
		result := (B*B - 4 * A * C ) ;
	end; // El discriminante de toda la vida, si es que es precioso

	function Im(A , B, C : real) : real;
	begin
		result := sqrt( -Discriminante(A,B,C) ) / (2 * A) ; { recordar el parentesis para que se multiplique primero 2A}
	end; // la funcion Im es la parte imaginaria
	
	function Re(A , B : real) : real;
	begin
		result := - B / (2 * A) ;
	end; // la funcion Re es la parte real

const	
	//Cambio de letras
	letra_minuscula : char = 'a';
	letra_mayuscula : char = 'A';
	
	//Los digitos y el valor del numero 
	decimales   : char = '2';
	unidades    : char = '5';
	
	//Paridad de un numero
		  x : integer = 9;
	
	//Estan dos letras ordenadas?
	    letra_1 : char = 'b';
	    letra_2 : char = 'a';

	//Area de rectangulo
	    largo   : real = 3.4;
	    ancho   : real = 2.4;

	//Volumen de esfera
	    radio   : real = 4.5;

{Sea ax^2 + bx + c un polinomio de grado 2 o sea que necesariamente a<>0 (o sea que a es diferente de 0 }
	a: real = 1;
	b: real = 0;
	c: real = 1;
begin
	
	writeln('mayuscula correspondiente es ',chr(ord(letra_minuscula) - 32));
	writeln('minuscula correspondiente es ',chr(ord(letra_mayuscula) + 32));
	writeln; //para separar por espacios

//----------------------------------------------------------------------------------
	
	writeln('el valor del número en base 10 es ', 10*(ord(decimales) - ord('0')) + (ord(unidades)- ord('0')));
	writeln;
		
//----------------------------------------------------------------------------------


	if ( x mod 2 = 0) then
		 writeln('El numero es par')
	else
		writeln('El numero es impar');
	
	writeln;
		
//----------------------------------------------------------------------------------

	if ( letra_1 < letra_2 ) then
		writeln('Las letras estan ordenadas alfabeticamente')
	else if ( letra_1 = letra_2) then
		writeln('Las letras son iguales')
	
	else
		writeln('Las letras no estan ordenadas alfabeticamente');
		
	writeln;
	
//----------------------------------------------------------------------------------
	
	writeln(' El area del rectangulo es ', Area1(largo,ancho));
	writeln;

//----------------------------------------------------------------------------------

	writeln(' El volumen de la esfera es', Volumen(radio));
	writeln;
		
//----------------------------------------------------------------------------------

{Hay dos formas de enfocar este problema, saber si las areas son iguales conociendo sus areas para ello se resolveria usando el codigo:

	writeln('Introduzca el area de un rectangulo en metros cuadrados');
	readln(K);
	writeln('Introduzca el area de un circulos en metros cuadrados');
	readln(L);
	
	if K=L then
		writeln('Ambas figuras poseen la misma area')
	else 
		writeln('Sus areas difieren');

pero es mas divertido resolverlo teniendo que calcular sus areas a partir de su formula. Por tanto y usando tres constantes anteriormente usadas

}
	
	if Area1(ancho,largo) = Area2(radio) then //se usan las mismas funciones y constantes
		writeln('Ambas figuras poseen la misma area')
	else 
		writeln('Sus areas difieren');
		writeln;	
		
//----------------------------------------------------------------------------------

{Sea ax^2 + bx + c un polinomio de grado 2 o sea que necesariamente a<>0 (o sea que a es diferente de 0 }

	if (Discriminante(a,b,c) > 0) or (Discriminante(a,b,c) = 0) then
		writeln('Este polinomio contiene una o mas raices reales')
	else if (Discriminante(a,b,c) < 0) and (Re(a,b)=0) then
		writeln('Las raices complejas del polinomio son: ', Im(a,b,c), 'i  y  ', Im(a,b,c), 'i' )
	else
		writeln('Las raices complejas del polinomio son: ',Re(a,b), ' + ', Im(a,b,c), 'i  y  ', Re(a,b), ' - ', Im(a,b,c), 'i' );

end.
