{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ciclos;

var 
	i , tabla: integer;
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

begin

	for tabla:=1 to 5 do
	for i := 1 to 10 do
	writeln(tabla, ' por ', i, ' es ', tabla*i);

end.
