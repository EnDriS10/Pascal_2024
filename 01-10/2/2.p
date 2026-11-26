{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ciclos2;

var 
	i , a: integer;
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


{ este programa se llama factorial}
begin

	writeln('introduzca a');
	readln(a);
	for i := 1 to (a-1) do
	a := a*i;
	writeln(a);

end.
