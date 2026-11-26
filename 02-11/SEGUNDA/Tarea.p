{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

const
	Papel: char = ' ';

type
	Tipo_Geom = (Cuadrado, Rectangulo, Triangulo, TrianguloIzqdo, TrianguloDrcho, FIN );
	
	Tipo_Figure = record
	figure: Tipo_Geom;
	tinta: char;
	alto: integer;
	ancho: integer;
	end;

//--------------------------------------------------------------------------------------------------
function Es_Figura(a:Tipo_Geom ; fig: Tipo_Figure): Boolean;
begin
result:= (fig.figure = a);
end;

function Finale(fig: Tipo_Figure): Boolean;
begin
result:= (fig.figure = FIN);
end;

function min(n1, n2: integer):boolean;
begin
result:= n1 < n2;
end; //el minimo de 2, esta vez lo usaremos para saber cual es la menor altura, tendra que ser boolean para obetner el fig.figure a partir del fig.alto

//--------------------------------------------------------------------------------------------------

procedure leer(var fig: Tipo_Figure);
begin
	writeln('Introduce una figura');
	readln(fig.figure);
	
	if not  Finale(fig) then
	begin
		writeln('Introduce una "Tinta" para la figura');
		readln(fig.tinta);
		writeln('Introduce una altura');
		readln(fig.alto);

		if Es_Figura(Rectangulo,fig) then
		begin
			writeln('Introduce un ancho para la figura');
			readln(fig.ancho);
		end
		else
		fig.ancho := fig.alto;
	
	writeln();
end;

end;
//Se anadio FIN como tipo de geometria para hacer una condicional aqui para parar el ciclo 
//Se separa con if not finale para que si fig.figure coincide con FIN terminar el programa alli

procedure escrn(car: char; n: integer);
var
	i: integer;
begin
	for i := 1 to n do
		write(car);
	end;


//--------------------------------------------------------------------------------------------------
//Triangulos

procedure escrfilatrianguloIzq(fig: Tipo_Figure; ancho: integer);
begin
	escrn(fig.tinta, ancho);
	writeln();
end;


procedure escrtrianguloIzq(fig: Tipo_Figure);
var
	fila: integer;
begin
	for fila := 1 to fig.alto do
		escrfilatrianguloIzq(fig,fila);
end;

procedure escrfilatriangulo(fig: Tipo_Figure;fila, ancho: integer);
begin
	escrn(Papel, (ancho-fila+1));
	escrn(fig.tinta, 2*fila-1);
	writeln();
end;

procedure escrtriangulo(fig: Tipo_Figure);
var
	fila: integer;
begin
	for fila := 1 to fig.alto do
		escrfilatriangulo(fig,fila, fig.alto);
		
end;

procedure escrfilatrianguloDrch(fig: Tipo_Figure;fila, ancho: integer);
begin
	escrn(Papel, (ancho-fila));
	escrn(fig.tinta, fila);
	writeln();
end;

procedure escrtrianguloDrch(fig: Tipo_Figure);
var
	fila: integer;
begin
	for fila := 1 to fig.alto do
		escrfilatrianguloDrch(fig,fila, fig.alto);
end;
//--------------------------------------------------------------------------------------------------
//Cuadrado

procedure escrfilacuadrado(fig: Tipo_Figure);
begin
	escrn(fig.tinta, fig.alto);
	writeln();
end;

procedure escrcuadrado(fig: Tipo_Figure);
var
	fila: integer;
begin
	for fila := 1 to fig.alto do
		escrfilacuadrado(fig);
end;

//Rectangulo

procedure escrfilarectangulo(fig: Tipo_Figure);
begin
	escrn(fig.tinta, fig.ancho);
	writeln();
end;

procedure escrrectangulo(fig: Tipo_Figure);
var
	fila: integer;
begin
	for fila := 1 to fig.alto do
		escrfilarectangulo(fig);
end;
//--------------------------------------------------------------------------------------------------
procedure Graf(fig : Tipo_Figure);
begin
	if Es_Figura(Cuadrado,fig) then
		escrcuadrado(fig)
	else if Es_Figura(Rectangulo,fig) then
		escrrectangulo(fig)
	else if Es_Figura(Triangulo,fig) then
		escrtriangulo(fig)
	else if Es_Figura(TrianguloIzqdo,fig) then
		escrtrianguloIzq(fig)
	else if Es_Figura(TrianguloDrcho,fig) then
		escrtrianguloDrch(fig);
	writeln();
end;

procedure Enunciar(fig : Tipo_Figure);
begin
	if (not Finale(fig)) then
	begin
	
		write(fig.figure,' "',fig.tinta,'" ',fig.alto,' ');
	
		if Es_Figura(Rectangulo,fig) then
		begin
			writeln(fig.ancho);
		end
		else
			writeln();
	end; 
end;

procedure Bucle(var fig : Tipo_Figure);

var
	contador:integer;
	lineas: integer;
	h: integer; //las alturas, para encontar la minima
	fig_m: Tipo_Geom; // la figura con altura minima
	
begin
	
	leer(fig); //se pone un leer primero para que se tengan los datos de una primera figura antes del bucle, esto hara que si intoducimos FIN al principio se termine, y ademas arregla problemas relacionados con los contadores de lineas etc. piense que si leer seria lo primero del bucle, al final cuando se introduzca FIN, los contadores sumarian los ultimos datos de la ultima figura, el contador sumaria 1 y las lineas sumaria la ultima altura guardada en el record
	
	contador:=0;
	lineas:=0;
	h:= fig.alto;
	fig_m:=fig.figure;

while not Finale(fig) do
begin

	Enunciar(fig);
	Graf(fig);
	contador:=contador+1;
	lineas:= lineas + fig.alto;
	leer(fig);
	// por ultimo se pone dentro del ciclo para que actualice el record y vuelva a ejecutar todo;
	
	if min(fig.alto,h) and (not Finale(fig)) then  
	begin
		fig_m:=fig.figure		
	end;
	// si la altura actual es menor a la anterior, guarda la nueva figura, actualizandose en cada iteracion haciendo que al final recoja el de menor altura xd
	//se añade el not finale ya que en la iteracion final se guarda el ultimo FIN

end;

if Finale(fig) then
begin

	writeln(contador,' figuras, ', lineas, ' lineas, menor:', fig_m);
	writeln('Cerrando programa...');
	writeln('Programa Cerrado');
	Halt;
end;	
end;

//--------------------------------------------------------------------------------------------------

var
	Figura: Tipo_Figure;
//--------------------------------------------------------------------------------------------------

begin

Bucle(Figura);

//nota final: el programa no contempla cuando hay dos figuras con la minima altura ya que no se hablaba de eso en el enunciado, anyway 

end.
