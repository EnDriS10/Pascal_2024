{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;
const
	Punto:char ='.';
	Esp: char = ' ';
	Tab: char = '	';
	MaxColumn = 'J';
	MaxFila = 10;
	MaxFigs = 200;

//--------------------------------------------------------------------------------------------------

type
	TipoColumn = 'A'..MaxColumn;
	TipoFila = 1..MaxFila;
	
	TipoClasif = (Submarino, Dragaminas, Fragata, PortaAviones, FIN);
	TipoOrientac =(Vertical, Horizontal);
	
	TipoPosc = record
	fila: integer;
	column:TipoColumn;
	end;
	
	TipoBarco = record
	clasif: TipoClasif;
	inicial: char;
	long: integer;
	end; 
	
	TipoFig = record
	barco: TipoBarco;
	posc: TipoPosc;
	orientac: TipoOrientac;
	end;
//--------------------------------------------------------------------------------------------------
	TipoPal = string;
//--------------------------------------------------------------------------------------------------
	
	TipoArrayFigs = array[1..MaxFigs] of TipoFig;
	
	TipoTablero =array[TipoFila,TipoColumn] of char;
	
//--------------------------------------------------------------------------------------------------
function Esblanco(c: char): boolean;
begin
	result := (c = Esp) or (c = Tab);
end;

function EsFin(clasif: TipoClasif ): boolean;
begin
	result := clasif = FIN;
end;

function CasillaOcupada(tab: TipoTablero; fil:integer; column: char): boolean;
begin
	Result := (tab[fil, column] <> Punto);
end;

//--------------------------------------------------------------------------------------------------
//Procedures y F para la lectura controlada	

procedure Error(ok:boolean);
begin
if not ok then begin
	writeln('Error en la Entrada');
end;
end;

procedure AddCar(var pal: TipoPal; c: char);
var
	n: integer;
begin
	n := length(pal);
	n := n + 1;
	setlength(pal, n);
	pal[n] := c;
end; //toma un string y le añade un caracter 

procedure LeerPal(var fich: text; var pal: TipoPal);
var
	c: char;
	Existpal: boolean;
begin
	Existpal := False;
	pal := '';
	while not eof(fich) and not Existpal do begin
		if eoln(fich) then begin
			readln(fich);
		end
		else begin
			read(fich, c);
			Existpal := not Esblanco(c);
			if Existpal then begin
				AddCar(pal, c); //va creando la palaba añadiendo caracteres
			end;
		end;
	end;
	while Existpal and not eof(fich) and not eoln(fich) do begin
		read(fich, c);
		Existpal := not Esblanco(c);
		if Existpal then begin
			AddCar(pal, c);
		end;
	end;
end;//el primer bucle busca condiciones para el iniciio de la palabra y el segundo continua hasta el final de una palabra

procedure LeerClasif(var fich: text; var clasif: TipoClasif; var ok: boolean);
var
	pal: TipoPal;
	pos: integer;
begin
	LeerPal(fich, pal);
	val(pal, clasif, pos);
	ok := pos = 0;
end; //Convierte una palabra en Clasif

procedure LeerOrientac(var fich: text; var orientac: TipoOrientac; var ok: boolean);
var
	pal: TipoPal;
	pos: integer;
begin
	LeerPal(fich, pal);
	val(pal, orientac, pos);
	ok := pos = 0;
end;//Convierte una palabra en Orientac

procedure LeerFila(var fich: text; var n: integer; var ok: boolean);
var
	pal: TipoPal;
	pos: integer;
begin
	LeerPal(fich, pal);
	val(pal, n, pos);
	ok := (pos = 0) and (n < 10) ;
	
end;//Convierte una palabra en numeros OJO(numeros de 1-10)

procedure LeerCar(var fich: text; var c: char; var ok: boolean);
var
	pal: TipoPal;
begin
	LeerPal(fich, pal);
	ok := length(pal) = 1;
	if ok then begin
		c := pal[1];
	end;
end;//Convierte una palabra en Caracter

procedure LeerPos(var fich: text; var posc: TipoPosc; var ok: boolean);
begin
	LeerCar(fich, posc.column, ok);
	if ok then begin
		LeerFila(fich, posc.fila, ok);
	end;
end;
	
//--------------------------------------------------------------------------------------------------

procedure LeerFig(var fich: text; var fig: TipoFig; var ok: boolean);
begin
	LeerClasif(fich, fig.barco.clasif, ok);
	if ok then begin
		if not EsFin(fig.barco.clasif) then begin
			LeerOrientac(fich, fig.orientac, ok);
			if ok then begin
				LeerPos(fich, fig.posc, ok);
			end;
		end;
	end;
end; //Reune todos los procedures de la lectura controlado buscando info sobre fig

procedure Assglong (var fig: TipoFig);
begin
	Case fig.barco.clasif of
	Submarino: fig.barco.long := 1;
	Dragaminas: fig.barco.long := 2;
	Fragata: fig.barco.long := 3;
	PortaAviones: fig.barco.long := 4;
	end;
end;

procedure AssgInicial(var fig:TipoFig);
begin
	Case fig.barco.clasif of
	Submarino: fig.barco.inicial :='S';
	Dragaminas: fig.barco.inicial :='D';
	Fragata: fig.barco.inicial :='F';
	PortaAviones: fig.barco.inicial :='P';
	end;
end;

procedure GuardarFig(var fich: text; var fig: TipoFig; var cjtofig: TipoArrayFigs ;var total:integer ; var ok: boolean);
begin
	total:= 0;
	repeat
		LeerFig(fich, fig, ok);
		if ok and not EsFin(fig.barco.clasif) then begin
			Assglong(fig);
			AssgInicial(fig);
			total:= total + 1;
			cjtofig[total] := fig; 
		end
		else begin
		Error(ok);
		end;
	until eof(fich) or EsFin(fig.barco.clasif)
end;//si se consigue la info de la fig se mete en el conjunto de figs, al final total es el numero de figs

//--------------------------------------------------------------------------------------------------

procedure InicTablero(var tab: TipoTablero);
var
	i: integer;
	j: char;
begin
	for i := 1 to MaxFila do
		for j := 'A' to MaxColumn do
			tab[i, j] := Punto;
end; //SE USAN LAS CONSTANTES DE MAXIMO NUMERO DE INDICE

procedure ColocarBarcos(var tab: TipoTablero; cjtofig: TipoArrayFigs; total: integer);
var
	i, j, fila: integer;
	col: char;
	valido: boolean;
	fig: TipoFig;
	
begin
	InicTablero(tab);
	j := 0;

	while j < total do
	begin
		j := j + 1;
		fig := cjtofig[j];
		fila := fig.posc.fila;
		col := fig.posc.column;


		valido := true;

// Verificar espacio para el barco
		for i := 0 to fig.barco.long - 1 do
			begin
			if (fig.orientac = Horizontal) then
			begin
				if (chr(ord(col) + i) > MaxColumn) or CasillaOcupada(tab, fila, chr(ord(col) + i)) then begin
				valido := false;
				end;
				end
				else if (fig.orientac = Vertical) then begin
				if (fila + i > MaxFila) or CasillaOcupada(tab, fila + i, col) then begin
				valido := false;
				end;
			end;
		end;

// Colocar barco si es válido
		if valido then
		begin
			for i := 0 to fig.barco.long - 1 do
			begin
				if fig.orientac = Horizontal then
				begin
					tab[fila, chr(ord(col) + i)] := fig.barco.inicial
				end
				else begin
					tab[fila + i, col] := fig.barco.inicial;
				end;
			end;
		end
		else begin
			writeln('Error al colocar el barco: ', fig.barco.inicial, ' en posición ', col, fila);
		end;
	end;
end;

procedure DibujarTablero(tab: TipoTablero);
var
	i: integer;
	j: char;
begin
	for i := 1 to MaxFila do
	begin
	for j := 'A' to MaxColumn do
		write(tab[i, j], ' ');
		writeln;
	end;
end;//SE USAN LAS CONSTANTES DE MAXIMO NUMERO DE INDICE

procedure Exedisp(var fich:text ; tab: TipoTablero; ok : boolean);
var
	posc: TipoPosc;
begin
	while not eof(fich) do begin
		LeerPos(fich, posc, ok);
		if ok then begin
			if CasillaOcupada(tab, posc.fila, posc.column) then begin
				writeln('Tocado');
			end
			else
				writeln('Agua');
		end
		else if not eof(fich) then begin
			Error(ok);
		end;
	end;
end;

//--------------------------------------------------------------------------------------------------

var
	fich: text;
	fig: TipoFig;
	ok: boolean;
	
	cjtofig: TipoArrayFigs;
	total : integer;
	
	dibujo: TipoTablero;

begin
	assign(fich, 'datos.txt');
	reset(fich);
		GuardarFig(fich,fig,cjtofig,total,ok);
		ColocarBarcos(dibujo, cjtofig, total);
		DibujarTablero(dibujo);
		Exedisp(fich, dibujo,ok);
	close(fich);

end.

