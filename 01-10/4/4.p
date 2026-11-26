{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ciclos3;

var 
	i , a, b: integer;
{

begin

	while (condicon) do
	begin
	(accion);
	end;

	repeat 
	(accion);
	until
	(condicion);

	for variable := valor_0 to/downto valor_final do
	(accion);

end.

}


{ este programa se llama Combinatoria}

function Factorial(a : integer) : integer;
begin
	for i := 1 to (a-1) do
	a := a*i;
	result := a;
end;	

function Combinatoria(a , b : integer) : real;
begin
	result := Factorial(a) / ( Factorial(b) * Factorial(a-b) ) ;
end;	


begin
	writeln('introduzca a');
	readln(a);
	writeln('introduzca b');
	readln(b);
	
	writeln(Combinatoria(a,b));

end.
