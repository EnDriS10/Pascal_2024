{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

(*
Al usar ord('Z')   resultado 90
 Al usar chr(90)   resultado Z
 
*)



(*
Tipos de Datos

integer
real
chr
string
boolean
 
*)

program Dato;

var
	A : char;

begin
	
	writeln('Introdce una letra');
	readln(A);
	writeln('Su equivalente numerico en el sistema ASCII es ', ord(A));

end.

(* Convertir letra en numero*)
