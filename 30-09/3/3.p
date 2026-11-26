{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program Tarea;

uses math; // esto es porque en el punto final tengo que usar un sqrt


{constante usada en este programa}
const
	Pi: real = 3.1416;

{variables usadas en el programa}
var
	//Cambio de letras 
	A: char;
	
	//Los digitos y el valor del numero 
	B , C : char ;
	D : integer;
	
	//Paridad de un numero
	E : integer;
	
	//Estan dos letras ordenadas?
	F , G : char;
	
	//Area de rectangulo
	H , I : real;
	
	//Volumen de esfera
	J : real;
	
	//Comparacion entre Areas
	K, L, M : real;
	
	//Ecuacion Cuadratica
	N, O, P : real;
	
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
	
begin

	writeln('Introduce una letra');
	readln(A);

case A of
	'a'..'z' : writeln('Su mayuscula correspondiente es ' , chr( ord(A) - 32 ) );
	'A'..'Z' : writeln( 'Su minuscula correspondiente es ' ,chr( ord(A) + 32 ) );

otherwise
	writeln('Letra no soportada');

end;

	writeln; //para separar los puntos por lineas 
		
//----------------------------------------------------------------------------------

	writeln('Introduzca un digito del 0-9');
	readln(B);
	writeln('Introduzca otro digito del 0-9');
	readln(C);
	
{ en el sistema decimal xy = 10x + y (forma de resolver el ejercicio) }
{ se le resta ord('0') ya que los digitos 0-9 son 48-58 y ord('0') = 48:
un ejemplo;

1 es 49 al restarle ord('0') o sea 49-48=1
}
	
	D := 10*( ord(B) - ord('0') ) + ( ord(C) - ord('0') );
	writeln('El valor del numero en el sistema en base 10 es ' , D);
	writeln;
		
//----------------------------------------------------------------------------------
	
	writeln('A continuacion introduzca otro numero');
	readln(E);
	
	if ( E mod 2 = 0) then
		 writeln('El numero introducido es par')
	else
		writeln('El numero introducido es impar');
	
	writeln;
		
//----------------------------------------------------------------------------------

	writeln('Esta vez introduzca dos letras, separadas por ENTER (es decir escribe letra1 presione ENTER y letra2)');
	readln(F);
	readln(G);

	if ( G > F ) then
		writeln('Las letras estan ordenadas alfabeticamente')
	else if ( G = F) then
		writeln('Las letras son iguales')
	
	else
		writeln('Las letras no estan ordenadas alfabeticamente');
		
	writeln;
	
//----------------------------------------------------------------------------------

	writeln('Sea ABCD un rectangulo, introduzca la longitud de su ancho AB en metros <m>');
	readln(H);
	writeln(' Ahora introduzca la longitud de su altura BC en metros <m>');
	readln(I);	
	writeln(' El area del rectangulo ABCD es ', Area1(H,I),' m^2');
	writeln;

{ para las partes de codigo donde se usan funciones,
realmente se podria haberr evitado, donde en vez de usar:

writeln(' El area del rectangulo ABCD es de ', Area1(H,I),' metros <m^2>');

se usaria:

writeln(' El area del rectangulo ABCD es de ', H * I,' metros <m^2>');

y eso, junto con el comentario de 11 lineas nos habria ahorrado 4 lineas por funcion
pero quise usar funciones dado que las dimos recientemente en clase :) }
		
//----------------------------------------------------------------------------------

	writeln('Se tiene una esfera, introduzca la longitud de su radio r en metros <m>');
	readln(J);
	writeln(' El volumen de la esfera es', Volumen(J),' m^3');
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

pero es mas divertido resolverlo teniendo que calcular sus areas a partir de su formula. Por tanto

}

	writeln('Existe un rectangulo introduzca sus dimensiones en <m>, largo y ancho respectivamente, separados por ENTER (es decir escribe largo presione ENTER y ancho )');
	readln(K);
	readln(L);
	writeln('Escriba ahora un radio r en <m> de un circulo');
	readln(M);
	
	if Area1(K,L) = Area2(M) then
		writeln('Ambas figuras poseen la misma area')
	else 
		writeln('Sus areas difieren');
		writeln;	
		
//----------------------------------------------------------------------------------

	writeln('El ultimo punto de este programa tiene como objetivo calcular las soluciones complejas de una ecuacion de segundo grado');
	writeln('Sea ax^2 + bx + c un polinomio de grado 2 o sea que necesariamente a<>0 (o sea que a es diferente de 0)');
	writeln('Introduzca respectivamente los coeficientes a, b, c separados por Enter (como le he acostumbrado a lo largo del programa)');
	readln(N);
	readln(O);
	readln(P);
	
	if (Discriminante(N,O,P) > 0) or (Discriminante(N,O,P) = 0) then
		writeln('Este polinomio contiene una o mas raices reales')
	else if (Discriminante(N,O,P) < 0) and (Re(N,O)=0) then
		writeln('Las raices complejas del polinomio son: ', Im(N,O,P), 'i  y  ', Im(N,O,P), 'i' )
	else
		writeln('Las raices complejas del polinomio son: ',Re(N,O), ' + ', Im(N,O,P), 'i  y  ', Re(N,O), ' - ', Im(N,O,P), 'i' );

end.
