{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program PracticaBingo;

const
	Esp: char =' ';
	Tab: char ='	';
	NumEnFila = 5;
	MaxNumFila = 3;
	MaxNumJugadores = 3;
	
	//Suposiciones
	MaxNumCartones = 20;
	MaxNumExtrac = 20;

type

	TipoPal = string;

	TipoColor = (rojo, verde, azul, amarillo, FIN);
	
	TipoArrayFila = array[1..NumEnFila] of integer; {Los números que contiene el array son 1 <x < 100}
	
	TipoFila = record
	Color: TipoColor;
	Fila: TipoArrayFila;
	end;


	TipoCarton = array[1..MaxNumFila] of TipoFila;
// 1 carton con varias(3) filas


	TipoJugador = record
	Carton: array[1..MaxNumCartones] of TipoCarton;
	total: integer;
	end;
// cartones que puede haber por jugador (suponemos 20)

	TipoGame = array[1..MaxNumJugadores] of TipoJugador;
// jugadores total(3) con sus respectivos cartones

	TipoBola = record
	Color: TipoColor;
	Num: integer;
	end;
	
	TipoExtrac= record
	Bola: array[1..MaxNumExtrac] of TipoBola;
	total: integer;
	end;
	
	TipoMatch = array[1..MaxNumJugadores] of boolean;
// nos dice cual jugador obtuvo un match en esta ronda (coincide con el total de jugadores)
	

//--------------------------------------------------------------------------------------------------
procedure ErrorEntrada(ok: boolean);
begin
	if not ok then begin
	writeln('Error de Entrada');
	end;
end;

procedure ErrorExtrac(ok: boolean);
begin
	if not ok then begin
	writeln('Error en la fase de Extracciones');
	end;
end;


function EsMayusc(c: char): boolean;
begin
	result := (c >= 'A') and (c <= 'Z');
end;

procedure PalMinusc(pal: TipoPal; var ok: boolean);
var
	n, i: integer;
begin
	n := length(pal);
	i := 1;
	ok:= True;
	while ok and (i < n) do begin 
		if pal <> 'FIN' then begin
			ok := not EsMayusc(pal[i]) //es minusc si ninguna de sus char es mayusuc
		end;
		i:= i+1;
	end;
end;

function Finale(color: TipoColor): boolean;
begin
	result:= color = FIN;
end;

//--------------------------------------------------------------------------------------------------
{Lectura Controlada}

function Esblanco(c: char): boolean;
begin
	result := (c = Esp) or (c = Tab);
end;

procedure AddCar(var pal: TipoPal; c: char);
var
	n: integer;
begin
	n := length(pal);
	setlength(pal, n+1);
	pal[n+1] := c;
end; //toma un string y le añade un caracter 

procedure LeerPal(var fich: text; var pal: TipoPal; var ok: boolean);
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

PalMinusc(pal,ok); // identifica si no tiene mayusc la palabra

end;//el primer bucle busca condiciones para el iniciio de la palabra y el segundo continua hasta el final de una palabra

procedure LeerNum(var fich: text; var n: integer; var ok: boolean);
var
	pal: TipoPal;
	pos: integer;
begin
	LeerPal(fich, pal, ok);
	val(pal, n, pos);
	ok := (pos = 0) and (n >= 1) and (n <= 100);
	if not ok then begin
		n:= -1; //Un -1 indica que habia un error de entrada
		end;
	
end;//Convierte una palabra en numeros OJO(numeros de 1-100)

procedure LeerColor(var fich: text; var color: TipoColor; var ok: boolean);
var
	pal: TipoPal;
	pos: integer;
begin
	LeerPal(fich, pal, ok);
	if ok and not Finale(color) then begin
		val(pal, color, pos);
		ok := pos = 0;
	end
	else begin
	ok:= False;
	end;
	
end; //Convierte una palabra en color

procedure LeerFila(var fich: text; var fila: TipoFila; var ok: boolean);
var
	i : integer;

begin
	LeerColor(fich,fila.Color,ok);
	i:=0;
	while ok and not Finale(fila.color) and (i < NumEnFila) do begin
		i:= i+1;
		LeerNum(fich, fila.Fila[i] , ok);
	end;
//si ok falla en el ciclo se terminan las iteraciones dejando a ok en falso

end; //Guarda una fila

procedure InicializarCarton(var carton: TipoCarton);
var
	i, j: integer;
begin
	for i := 1 to MaxNumFila do begin
		carton[i].color := FIN;
		for j := 1 to NumEnFila do begin
			carton[i].Fila[j] := 0;
		end;
	end;
end;

procedure LeerCarton(var fich: text; var carton: TipoCarton; var ok: boolean);
var
	i : integer;
begin

	i := 1;
	ok:= true;
	while ok and (i <= MaxNumFila) do begin
		LeerFila(fich, carton[i], ok);
		if not ok or Finale(carton[i].Color) then begin
			InicializarCarton(carton);
			Break;
		end;
	i := i + 1;
	end;

end; //Guarda un carton compuesto de filas

procedure LeerJugador(var fich: text; var jugador: TipoJugador; var ok: boolean);
var
	i,j : integer;
	color: TipoColor;
begin
	i:=1;
	j:=1;
	ok:= true;
	while ok and (j <= MaxNumFila) do begin
		LeerCarton(fich, jugador.carton[i] , ok);
		color:= jugador.carton[i][j].color;
		if not ok or Finale(color) then begin
			Break;
		end;
	jugador.total:= i ;//toma el numero de cartones de un jugador
	i:= i+1;
	j:=j+1;
	

	end;
end; //Guarda los cartones de los jugadores, cuando se termina un carton de (3) filas comienza a leer otro

procedure LeerGame(var fich: text; var game: TipoGame; var ok: boolean);
var
	i : integer;
begin
	i:=1;
	ok:=true;
	while ok and (i <= MaxNumJugadores) do begin
		LeerJugador(fich, game[i] , ok);
		i:= i+1;
	end;
end; //Guarda los cartones de los jugadores, cuando se termina un carton de (3) filas comienza a leer otro

procedure InicializarBola(var bola: TipoBola);
begin
	bola.Num := -1;
end; //deja la bola en valores muy distinguibles

procedure LeerBola(var fich: text; var bola: TipoBola; var ok: boolean);
begin
	InicializarBola(bola);
	LeerColor(fich,bola.Color,ok);
	if ok then begin
		LeerNum(fich, bola.Num, ok);
	end;

end; //Lee una bola en la fase de extraccion

//--------------------------------------------------------------------------------------------------
//Sorting coso

procedure swamp(var a, b: integer);
var
	aux: integer;
begin
	aux := a;
	a := b;
	b := aux;
end;

function PosMinDesde(arr: TipoArrayFila; pos: integer): integer;
var
	posmin, i: integer;
begin
	posmin := pos;
	for i := pos+1 to NumEnFila do begin
		if arr[posmin] > arr[i] then begin
			posmin := i;
		end;
	end;
	result := posmin;
end;

procedure sort(var arr: TipoArrayFila);
var
	i, posmin: integer;
begin
	for i := 1 to NumEnFila-1 do begin
		posmin := PosMinDesde(arr, i);
		swamp(arr[i], arr[posmin]);
	end;
end; //hasta aqui Selection sort 

procedure SortFila(var fila: TipoFila);
begin
	sort(fila.Fila);
end; //sort la lista de una fila

procedure SortCarton(var carton: TipoCarton);
var
	i: integer;
begin
	for i:=1 to MaxNumFila do begin
		SortFila( carton[i]);
	end;
end;//sort las filas de un carton

procedure SortJugador(var jugador: TipoJugador);
var
	i: integer;
begin
	
	for i:=1 to jugador.total do begin
		SortCarton( jugador.carton[i]);
	end;

end; // sort los cartones de un jugador

procedure SortGame(var game: TipoGame);
var
	i: integer;
begin
	
	for i:=1 to MaxNumJugadores do begin
		SortJugador(game[i]);
	end;
end;//sort la lista de las filas de los cartones de los jugadores

//--------------------------------------------------------------------------------------------------

function MatchColor(fila: TipoFila; color: TipoColor):boolean;
begin
	result:= fila.color = color;
end;

function MatchNum(a,b: integer):boolean;
begin
	result:= a = b;
end;


procedure MatchFila( var fila: TipoFila; bola: TipoBola; m: integer; var match: boolean);
var
	i:integer;
	controlador: boolean;
begin
	if MatchColor(fila , bola.color) then begin
		for i:=1 to NumEnFila do begin
			controlador:= MatchNum(fila.Fila[i], bola.num);
			if controlador then begin
				match:= True;
				fila.Fila[i]:= m;
			end;
		end;
	end;
	
end;//se usa un controlador porque va cambiando en cada iteracion
//Si al menos una vez hubo coincidencia entonces mtach se vuelve true

procedure MatchCarton(var carton: TipoCarton; bola: TipoBola; m: integer; var match:boolean);
var
	i: integer;
begin
	for i:=1 to MaxNumFila do begin
		MatchFila( carton[i], bola, m, match);
	end;
end;

procedure MatchJugador(var jugador: TipoJugador; bola: TipoBola; m:integer; var match: boolean);
var
	i: integer;
begin
	
	for i:=1 to jugador.total do begin
		MatchCarton( jugador.carton[i], bola, m, match);
	end;
end;

procedure MatchGame(var game: TipoGame; bola: TipoBola; m: integer; var CjtMatch: TipoMatch);
var
	i: integer;
begin
	
	for i:=1 to MaxNumJugadores do begin
		MatchJugador(game[i],bola,m,CjtMatch[i]);
	end;
end;


//--------------------------------------------------------------------------------------------------
//Procedures de Extraccion

procedure EscrBola(Bola: TipoBola);

begin
	writeln(bola.color,' ', bola.num);
end;
procedure EscrFila(fila: TipoFila; m:integer);
var
	i: integer;
begin
	write(fila.color,' ');
	for i:=1 to NumEnFila do begin
		if MatchNum(fila.Fila[i] , m) then begin
		write('XX ');			
		end
		else begin
		write( fila.Fila[i], ' ');
		end;
	end;
	writeln();
end;

procedure EscrCarton(carton: TipoCarton; m: integer);
var
	i: integer;
begin
	for i:=1 to MaxNumFila do begin
		EscrFila( carton[i], m);
	end;
	writeln();
end;


procedure EscrJugador(jugador: TipoJugador;n: integer; m : integer);
var
	i: integer;
begin
	
	for i:=1 to jugador.total do begin
		writeln('Jugador ', n, ' Carton ', i);
		EscrCarton( jugador.carton[i], m);
	end;
	writeln();
end;

procedure EscrGame(game: TipoGame; m:integer );
var
	i: integer;
begin
	
	for i:=1 to MaxNumJugadores do begin
		EscrJugador(game[i],i, m);
	end;
end;

//--------------------------------------------------------------------------------------------------

procedure InicializarCjtoMatch(var cjtoMatch: TipoMatch);
var
	i: integer;
begin
	for i := 1 to MaxNumJugadores do begin
		cjtoMatch[i] := false;
		end;
end;

function GanaFila(fila: TipoFila; m: integer):boolean;
var
	i: integer;
begin
	result:= True;
	for i:=1 to NumEnFila do begin
		if not MatchNum(fila.Fila[i], m) then begin;
			result:= False;
			Break;
		end;
	end;
end;

function GanaCarton(carton: TipoCarton; m: integer):boolean;
var
	i: integer;
begin
	result:= False;
	for i:=1 to MaxNumFila do begin
		if GanaFila(carton[i],m) then begin;
			result:= True;
			Exit;
			
		end;
	end;
end; //la logica de los siguientes deriva de este,
//esta en falso predeterminado, se busca  una fila al menos en el carton que tenga bingo, si se encuentra se para el ciclo para evitar reescribir 


function GanaJugador(jugador: TipoJugador; m: integer):boolean;
var
	i: integer;
begin
	result:= False;
	for i:=1 to jugador.total do begin
		if GanaCarton(jugador.carton[i],m) then begin;
			result:= True;
			Exit;
		end;
	end;
end;


function EndGame(game: TipoGame; m: integer):boolean;
var
	i: integer;
begin
	result:= False;
	for i:=1 to MaxNumJugadores do begin
		if GanaJugador(game[i],m) then begin;
			result:= True;
			Exit;
		end;
	end;
end;


procedure EnunciarTachado(game: TipoGame; m:integer; CjtoMatch: TipoMatch);
var
	i:integer;
begin
	for i:=1 to MaxNumJugadores do begin
		if CjtoMatch[i] then begin
			if GanaJugador(game[i], m) then begin
				writeln('Jugador ',i,': Bingo');
			end
			else begin
				writeln('Jugador ',i,': Tachado');
			end
		end
		else begin
			writeln('Jugador ',i,': Nada');
		end;
	end;
	writeln();
end;//


//--------------------------------------------------------------------------------------------------
function HayBola(bola: TipoBola):boolean;
begin
	result:= bola.num <> -1;
end;


procedure RunExtrac(var fich: text;var game: TipoGame; var bola: TipoBola;m: integer; var extrac: TipoExtrac; var CjtoMatch: TipoMatch;var ok: boolean );
var 
	i: integer;
begin
	i:=1;
	ok:= true;
	while ok and (not eof(fich)) and  (not EndGame(game, m)) do begin
		LeerBola(fich, bola, ok);
		if HayBola(bola) then begin

//			writeln('Extraccion No.', i); //Para enumerar extrac	
			MatchGame(game, bola, m,CjtoMatch);
			EscrGame(game, m);			
			EnunciarTachado(game, m, CjtoMatch);
			InicializarCjtoMatch(CjtoMatch);
			
			extrac.Bola[i] := bola;
			extrac.total:= i; //ambas extrac. almacenan las extracciones una vez ejecutadas
			i:=i+1;
		end;
	end;

end; 

//--------------------------------------------------------------------------------------------------

procedure EnunciarExtrac(extrac: TipoExtrac);
var
	i:integer;
begin
	for i:=1 to extrac.total do begin
		EscrBola(extrac.Bola[i]);
	end;
	writeln();
end;

function Empate(game: TipoGame; m:integer):boolean;
var
	i, contador :integer;
begin

	contador:=0;
	for i:=1 to MaxNumJugadores do begin
		if GanaJugador(game[i], m) then begin;
			contador := contador + 1;
		end;
	end;
	
	result := (contador <> 1);
end;

procedure EnunciarEndGame(game: TipoGame; extrac: TipoExtrac; m:integer);
var
	i:integer;

begin
	EnunciarExtrac(extrac);

	if Empate(game,m) then begin
		writeln('Empate');
	end
	else begin
		for i:=1 to MaxNumJugadores do begin
			if GanaJugador(game[i], m) then begin
				writeln('Ganador: Jugador ', i);
			end;
		end;
	end;
	
		

end;


//--------------------------------------------------------------------------------------------------
const
	q: integer = 101;
//es un parametro de control, que permite modificar el array a un valor que no es posible en la entrada por lo tanto muy  facil de detectar

var
	fich: text;
	bingo: TipoGame;

	bola: TipoBola; //Bolas de la fase de extraccion
	extrac: TipoExtrac; //Extracciones y cantidad de extracciones
	cjtomatch: TipoMatch; //Nos informa las coincidencias por ronda

	ok_config:boolean;
	ok_extrac:boolean;



//--------------------------------------------------------------------------------------------------

begin
	assign(fich, 'datos.txt');
	reset(fich);

	LeerGame(fich, bingo, ok_config);
	ErrorEntrada(ok_config);
	
	if ok_config then begin
	
		SortGame(bingo);
		EscrGame(bingo, q);
		RunExtrac(fich, bingo, bola,q,extrac,cjtomatch, ok_extrac);
		EnunciarEndGame(bingo, extrac,q);

		if not eof(fich) then begin
			ErrorExtrac(ok_extrac);
		end;
	end;
	close(fich);

end.

//Obsevaciones, debido a que el progrrama dice son 3 jugadores, si no se agregan los 3 jugadores en el fichero se tendra un error de entrada
