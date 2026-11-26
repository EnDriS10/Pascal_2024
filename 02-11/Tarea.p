{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

type

	Tipo_Rango = (Invitado, Aspirante, Maestro);
	Tipo_Palo = (Oros, Bastos, Copas, Espadas);
	Tipo_Valor = 1..12; //para bajara espanola
	Tipo_Num = 1..1000; //para NIF
	Tipo_Letra = 'A'..'Z';//para NIF
	
	Tipo_NIF = record
		num : Tipo_Num;
		letra : Tipo_Letra;
	end;
	
	Tipo_Carta = record
		palo : Tipo_Palo;
		valor: Tipo_Valor;
	end;
	
	Tipo_Mano = record
		c1 : Tipo_Carta;
		c2 : Tipo_Carta;
		c3 : Tipo_Carta; 
	end;
	
	Tipo_Jugador = record
		rango: Tipo_Rango;
		NIF : Tipo_NIF;
		mano: Tipo_Mano;
	end;


//------------------------------------------------------------------------------------------------

function Valor_carta(c: Tipo_Carta): integer;
	begin
	if (c.valor >= 10) or (c.valor=1) then
		result := 10
	else
		result := c.valor;
	end; //Funcion que calcula el valor de una carta independiente
	
function Valor_mano(m: Tipo_Mano): integer;
	begin
	result:= Valor_carta(m.c1)+Valor_carta(m.c2)+Valor_carta(m.c3);
	end; //sumar los valores en una mano
	
function Valor_jugador(j: Tipo_Jugador): integer;
	begin
	result:= Valor_mano(j.mano);
	end; //Aplica la funcion valor mano a un jugador

function Resta(n:integer): integer;
	begin
	if n < 20 then
		result:=20-n	
	else
		result:=50;
	end; //Lo usaremos para determinar el mas cercano a 20, ya que restaremos y encontraremos el minimo,
	// el minimo de la diferencia es el ganador, por logica xd 

function min_Resta(n1, n2: integer):integer;
begin
	if Resta(n1) < Resta(n2) then
	result:=Resta(n1)
	else 
	result:=Resta(n2);
end; //el minimo de dos numeros, pero con la funcion resta incluida, debido a que usaremos el minimo solamente en la resta, pense que seria optimo ya incluirlo, y no hacer otra funcion que lo hiciera

function Ganador_existe(j1, j2:Tipo_Jugador): boolean;
	begin
	result:= Resta(Valor_jugador(j1)) <> Resta(Valor_jugador(j2));
	end; //si la funcion anterior al ser evaluada en las dos manos, su minimo es diferente de 50, pues entonces eso significa necesariamente que existe un ganador


function Ganador(j1, j2:Tipo_Jugador): boolean;
	begin
	result:= min_Resta(Valor_Jugador(j1),Valor_Jugador(j2)) = Resta(Valor_Jugador(j1))
	end; //Si la funcion ganador devuelve un True, significa que el primer jugador leido es el ganador
	// si la menor diferencia es la diferencia de la mano del primer jugador entonces este es el ganador

//------------------------------------------------------------------------------------------------

procedure leer_carta (var c:Tipo_Carta);
	begin
	readln(c.valor);
	readln(c.palo);
	end;

procedure leer_NIF (var dni:Tipo_NIF);
	begin
	readln(dni.num);
	readln(dni.letra);
	end;

procedure leer_rango (var rank:Tipo_Rango);
	begin
	readln(rank);
	end;

procedure leer_jugador (var j:Tipo_Jugador);
	begin
	writeln('Escriba el NIF del jugador');
	leer_NIF(j.NIF);
	writeln('Escriba el rango del jugador');
	leer_rango(j.rango);
	
	writeln('Escriba las tres cartas de la mano del jugador');
	leer_carta(j.mano.c1);
	leer_carta(j.mano.c2);
	leer_carta(j.mano.c3);
	
	end;

procedure escr_ganador ( j1, j2:Tipo_Jugador);
	begin
	if Ganador_existe(j1,j2) then
	if Ganador(j1,j2) then
		writeln(', gana')
	else
		writeln(', pierde')
	else
		writeln(' ');
	end; //Esta funcion nos permitira escribir gana o pierde segun el jugador, solo tenemos que invertir los jugadores en el codigo princiapl, el primero seria evaluado en j1 y j2 y el segundo en j2 y j1, lee abajo para mas informacion

procedure escr_jugador(j1,j2 :Tipo_Jugador; n: integer);
	begin
		write('Jugador' , n , ': ', j1.rango, ', NIF ', j1.NIF.num ,'-', j1.NIF.letra,', ', Valor_jugador(j1), ' puntos');
		escr_ganador(j1,j2);
	end;

procedure escr_sentencia_ganadora ( j1, j2:Tipo_Jugador);
	begin
	if Ganador_existe(j1,j2) then
	if Ganador(j1,j2) then
		writeln('Ganador: Jugador_1')
	else
		writeln('Ganador: Jugador_2')
	else
		writeln('Ganador: Ninguno');
	end;
//------------------------------------------------------------------------------------------------

var

Jugador_1: Tipo_Jugador;
Jugador_2: Tipo_Jugador;

begin

	leer_jugador(Jugador_1);
	writeln('Repita los mismos pasos para el segundo jugador ...');
	leer_jugador(Jugador_2);
	writeln('...Calculando resultados del juego...');
	escr_jugador(Jugador_1,Jugador_2,1);
	escr_jugador(Jugador_2,Jugador_1,2);

{Explicacion del codigo:
Veamos que el procedure escr_jugador, escencialmente nos da toda la informacion del primer jugador en la que esta evaluada, por lo que en una primera instancia, se encuentra el primer jugador y la segunda vez que se usa, se hace con el segundo evaluado en primer lugar, ya que uscamos la informacion de el, ahora para saber cual pierde o gana pues se usa la misma logica, de ser evaluado primero en uno y luego en otro.
}

	escr_sentencia_ganadora(Jugador_1,Jugador_2);

end.
