{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Escribir un saludo en un fichero

	fpc -g -oa.out $% && echo ahol | a.out
}

program escrlinea;

var
	salida: text;	{ basicamente file of char }
begin
	assign(salida, 'datos.txt');
	rewrite(salida);
	write(salida, 'hola');
	writeln(salida);
	close(salida);
end.
