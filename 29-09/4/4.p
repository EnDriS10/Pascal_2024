
{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Ejemplo_clrscr;

uses crt;

begin
	writeln('Este es un ejemplo del uso de clrscr');
	readln; //para que el usuario presione enter
	clrscr; //Limpia la pantalla
	writeln('La pantalla ha sido limpiada');

end.
	
