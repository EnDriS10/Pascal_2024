{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;
const
	Punto:char ='.';
	Muerto:char ='X';

type

	Tipo_dim = record
		Num_column: integer;
		Num_fila: integer;
	end; // se penso en reutilizar tipo_dim para la posicion de la proa pero debido a que la columna es integer aqui y en la posicion es char se pone otro record, aunque se pondria implementar una funcion que transformara el numero en el char correspondiente :)

	Ind_fila = 1 .. 100; //Se considera 100 como Numero Maximo de Fila, se puede cambiar
	Ind_column=1..26;
	
	Form_column = 'A' .. 'Z';
//si el programa llega a Z decir que ha alcanzado el limite 	
	

	Tipo_posibles= (Submarino, Dragaminas, Fragata, PortaAviones, FIN);
	//Tipodebarco =Submarino..PortaAviones;

	Tipo_posic = record
		column: Form_column; 
		column_num: Ind_column; 
		fila: Ind_fila; //se toma asi para establecer los limites
	end;
	
	Tipo_Estado= (Tocado, Hundido , Intacto);
	Tipo_Orientac = (Vertical , Horizontal);

	
	Tipo_Barco= record
		tipo: Tipo_posibles;
		longitud: integer; // se define por el tipo
		orientacion: Tipo_Orientac; 
		//la proa se define por la orientacion: Arriba (Verticales), Izquierda (Horizontales)
		posicion: Tipo_posic; //la posicion de la proa
		estado: Tipo_Estado; //ultimo parametro

	end;

	Cjt_Barcos= array[1..1000] of Tipo_Barco; //array donde se almacenan los barcos
			//se considera un tamaño de Max_Barcos=1000 como maximo

//***************************
	
	Tipo_tablero = array[Ind_fila,Ind_column] of char;
	
	
//--------------------------------------------------------------------------------------------------

function Es_ok(barco:Tipo_Barco):boolean;
begin
	result:=barco.tipo<>FIN;
end;

// Verifica si una casilla del tablero ya está ocupada
function Casilla_Ocupada(tab: Tipo_tablero; fila, column: integer): boolean;
begin
	Casilla_Ocupada := (tab[fila, column] <> Punto);
end;

//--------------------------------------------------------------------------------------------------
//Procedures dedicados al input

procedure leer_dim (var dim:Tipo_dim);
begin
	writeln('Introduzca el numero de filas, presione Enter y luego introduzca el numero de columnas');
	readln(dim.Num_fila);
	readln(dim.Num_column);
end;

procedure Num_Column(var barco:Tipo_Barco);

begin

	barco.posicion.column_num := Ord(barco.posicion.column) - Ord('A') + 1; 

end;

procedure leer_barco(var barco:Tipo_Barco; var fin: boolean);
begin
	writeln('Introduzca el tipo de barco');
	readln(barco.tipo);
	
	if Es_ok(barco) then
	begin
		writeln('Introduzca su orientacion (Vertical u Horizontal)');
		readln(barco.orientacion);
		writeln('Introduzca su posicion, comenzando por el numero de columna de la proa, presione Enter y luego introduzca la fila en la cual se encuentra la proa');
		readln(barco.posicion.column);
		Num_Column(barco); // reescribe la columna de letras a numero :)
		readln(barco.posicion.fila);
		writeln('Introduzca el estado del barco');
		readln(barco.estado);
		writeln();
	end
	else
		fin:= True;
		exit;
	
end;

procedure def_longt(var barco:Tipo_Barco);
begin
	Case barco.tipo of
	Submarino: barco.longitud:=1;
	Dragaminas: barco.longitud:=2;
	Fragata: barco.longitud:=3;
	PortaAviones: barco.longitud:=4;
	end;
end;

procedure leer_cjt_barcos(var barco:Tipo_Barco;var CjtBarcos:Cjt_Barcos;var total, hund:integer);		

var
	fin: boolean;
begin
fin:=False;
hund:=0;
total:=0; //se define fuera del ciclo

while not fin do
begin
	leer_barco(barco,fin);
	def_longt(barco);
	
	if not fin then
	begin
		total:=total + 1;
			
		if barco.estado = Hundido then
		begin
			hund:= hund +1;
		end;
		CjtBarcos[total] := barco;
	end;

end;
end;

//--------------------------------------------------------------------------------------------------
//Procedures dedicados al output
procedure Inicial(barco:Tipo_Barco;var letra:char);
begin

	if barco.estado = Hundido then
	begin
		letra := Muerto;
	end
	else
		Case barco.tipo of
		Submarino: letra:='S';
		Dragaminas: letra:='D';
		Fragata: letra:='F';
		PortaAviones: letra:='P';
		end;

end;

procedure Inicializar_Tablero(var tab: Tipo_tablero; dim:Tipo_dim);
var
	i, j: integer;
begin
	for i := 1 to dim.Num_fila do
		for j := 1 to dim.Num_column do
			tab[i, j] := Punto;
end;

procedure Colocar_Barco_Tablero(var tab: Tipo_tablero; CjtBarcos:Cjt_Barcos; dim:Tipo_dim;total:integer);
var
	i,j: integer;
	fila, col: integer;
	letra: char;
	barco: Tipo_Barco;

begin

for j:=1 to total do
begin

	barco := CjtBarcos[j];
	Inicial(barco, letra);
	
	fila := barco.posicion.fila;
	col := barco.posicion.column_num;

	for i := 0 to barco.longitud - 1 do
	begin
		if (barco.orientacion = Horizontal) and (col + i <= dim.Num_column) then //las restrinsiones de la columna y fila es para no pasarse del array
			 if not Casilla_Ocupada(tab, fila, col + i) then //un if anidado que me diga si no esta ocupada la casilla
        			tab[fila, col + i] := letra
		else if (barco.orientacion = Vertical) and (fila + i <= dim.Num_fila) then
			 if not Casilla_Ocupada(tab, fila + i, col) then
	        		tab[fila + i, col] := letra;
		end;
	end;
end;

procedure Colocar_Barco_SI(var tab: Tipo_tablero; CjtBarcos:Cjt_Barcos; dim:Tipo_dim;total:integer);
begin

	if (CjtBarcos[1].tipo <> FIN) then
	begin
		Colocar_Barco_Tablero(tab,CjtBarcos,dim,total);
	end; //este procedure añade el caso en que no se introduzca ningun barco
end;

procedure Dibujar_Tablero(tab: Tipo_tablero; dim:Tipo_dim);
var
	i, j: integer;
begin
	for i := 1 to dim.Num_fila do
	begin
	for j := 1 to dim.Num_column do
		write(tab[i, j], ' ');
		writeln;
	end;
end;


//--------------------------------------------------------------------------------------------------
var
	
	Dimensiones : Tipo_dim; //para saber el actual size 
	Barco: Tipo_Barco;
	ConjuntoBarcos: Cjt_Barcos;
	total_barcos:integer;
	barcos_hundidos:integer;
	Tablero: Tipo_Tablero;
	
begin

leer_dim(Dimensiones);
leer_cjt_barcos(Barco, ConjuntoBarcos,total_barcos,barcos_hundidos);


Inicializar_Tablero(Tablero, Dimensiones);
Colocar_Barco_SI(Tablero, ConjuntoBarcos, Dimensiones,total_barcos);
Dibujar_Tablero(Tablero, Dimensiones);


writeln(total_barcos, ' barcos');
writeln(barcos_hundidos, ' hundidos');

end.

// el codigo comentado que se me quedo sin borrar son heridas de guerra xd
