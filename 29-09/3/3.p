(*
Leyes de Morgan (expreciones equivalentes )

not (a and b)---------------(not a) or (not b)
not (a or b)----------------(not a) and (not b)


*)

program Antecesor_y_Sucesor;

var
	A: integer ;

begin

	writeln('Escribe un numero natural');
	readln(A);
	writeln ('Su antecesor es ',pred(A), ' y su sucesor es ',succ(A));
	
	(* Para antecesor (pred(A))
	Para succesor (succ(A))*)

end.
	
