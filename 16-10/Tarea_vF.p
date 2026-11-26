{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

function Numeric(test: char) : real;
begin
	case test of
		'A' : result := 0.0 ;
		'B' : result := 5.0 ;
		'C' : result := 10.0 ;
		//se anaden casos que no estaban en el ejercicio anterior
		'a' : result := 0.0 ;
		'b' : result := 5.0 ;
		'c' : result := 10.0 ;
	end;
end;

function  Media(test:char ; nota:real):real;
begin
	if Numeric(test) <> 0 then	
		result:= (Numeric(test) + nota)/2
	else
		result := 0; //esto concuerda conque si el test es A pues su media vale 0
end;

function  Apto(test:char ; nota:real):boolean;
begin
	result:= Media(test,nota) > 5.0 ;
end;

function min_2(n1, n2: real):real;
begin
	if n1 < n2 then
	result:=n1
	else 
	result:=n2;
end; //el minimo de 2 pues lo usaremos para el minimo de 3

function min_3(n1, n2, n3: real):real;
begin
	if min_2(n1,n2) < n3 then
	result:=min_2(n1,n2)
	else 
	result:=n3;
end;



function max_2(n1, n2: real):real;
begin
	if n1 > n2 then
	result:=n1
	else 
	result:=n2;
end; //el maximo de 2 pues lo usaremos para el maximo de 3

function max_3(n1, n2, n3: real):real;
begin
	if max_2(n1,n2) > n3 then
	result:= max_2(n1,n2)
	else 
	result:=n3;
end;

function intermed_3(n1, n2, n3: real):real;
begin
	if min_2(n1,n2) > n3 then
	result:=min_2(n1,n2)
	else 
	result:=max_2(n1,n2);
end; //la condicion para que sea intermedio es que el minimo de dos sea mayor que un tercero, o que el maximo de dos sea menor que un tercero

procedure Nota_Estudiante(n: integer; var letra: char; var num:real); //se usa var para que se almacene en el test originarl
begin
	writeln('Introduca la nota del test del alumno ', n, ' .Recuerde que debera ser A,B o C');
	readln(letra);
	writeln('Introduca tambien la nota de la prueba del alumno ', n, ' .Recuerde que debera ser un numero entre 0.00-10.00');
	readln(num);
	
end;

procedure Escr_Apto(test: char; nota:real; n:integer);
begin
		
	if Apto(test,nota) then
		writeln('El alumno ', n ,' es apto ', Media(test,nota):0:2)
	else 
		writeln('El alumno ', n ,' no es apto ', Media(test,nota):0:2);

end;

procedure Org_(a,b,c:real); //este procedure te print tres numeros organizados teniendo en cuenta las funciones de arriba xd
begin
	writeln(min_3(a,b,c):0:2);
	writeln(intermed_3(a,b,c):0:2);
	writeln(max_3(a,b,c):0:2);
	
{Se considero dos decimales despues de la coma ya que cualquier numero dividido entre dos puede representarse con un decimal despues de la coma}
	
end;


var
	test1 : char;
	prueba1 : real;//Estudiante 1
	
	test2 : char;
	prueba2 : real; //Estudiante 2
	
	test3 : char;
	prueba3 : real; //Estudiante 3

begin

	Nota_Estudiante(1,test1,prueba1);
	Nota_Estudiante(2,test2,prueba2);
	Nota_Estudiante(3,test3,prueba3);
	//con estos se almacena el input
	Escr_Apto(test1,prueba1,1);
	Escr_Apto(test2,prueba2,2);
	Escr_Apto(test3,prueba3,3);
	//con esto se dice si es apto o no
	Org_(Media(test1,prueba1),Media(test2,prueba2),Media(test3,prueba3));
	//con esto se organiza


end.
