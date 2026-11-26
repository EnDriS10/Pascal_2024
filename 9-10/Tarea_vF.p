{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

function Numeric(test: char) : real;
begin
	case test of
		'A' : result := 0.0 ;
		'B' : result := 5.0 ;
		'C' : result := 10.0 ;
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

const
	test1 : char = 'A' ;
	prueba1 : real = 8.0 ; //Estudiante 1
	
	test2 : char = 'B' ;
	prueba2 : real = 9.0 ; //Estudiante 2
	
	test3 : char = 'C' ;
	prueba3 : real = 10.0 ; //Estudiante 3

begin
	if Apto(test1,prueba1) then
		writeln('es apto ',Media(test1,prueba1):0:2)
	else 
		writeln('no es apto ',Media(test1,prueba1):0:2); //Estudiante1


	if Apto(test2,prueba2) then
		writeln('es apto ',Media(test2,prueba2):0:2)
	else 
		writeln('no es apto ',Media(test2,prueba2):0:2);//Estudiante2


	if Apto(test3,prueba3) then
		writeln('es apto ',Media(test3,prueba3):0:2)
	else 
		writeln('no es apto ',Media(test3,prueba3):0:2);//Estudiante3

		
writeln(min_3(Media(test1,prueba1),Media(test2,prueba2),Media(test3,prueba3)):0:2);
writeln(intermed_3(Media(test1,prueba1),Media(test2,prueba2),Media(test3,prueba3)):0:2);
writeln(max_3(Media(test1,prueba1),Media(test2,prueba2),Media(test3,prueba3)):0:2);

{Se considero dos decimales despues de la coma ya que cualquier numero dividido entre dos puede representarse con un decimal despues de la coma}

end.
