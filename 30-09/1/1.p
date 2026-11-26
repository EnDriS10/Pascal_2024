
{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Casev;

var
	A: char;

begin

	writeln('Introduce una letra');
	readln(A);

case A of
	'a'..'z' : writeln( chr( ord(A) - 32 ) );
	'A'..'Z' : writeln( chr( ord(A) + 32 ) );

otherwise
	writeln('Letra no soportada');

end;

end.
