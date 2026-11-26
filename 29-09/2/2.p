{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

(*
Comparadores logicos

Algebra de Boole

• Negación: not

	not True = False
	not False = True

• Conjunción: and

	False and False = False
	False and True = False
	True and False = False
	True and True= True

• Disyunción: or

	False or False = False
	False or True = True
	True or False = True
	True or True = True

• Disyunción exclusiva: xor

	A xor B
	(A and (not B)) or ((not A) and B)

*)



program Ano_Bisiesto;

var
	A: integer;

begin

	writeln('Escribe un anyo');
	readln(A);
	
	if ((A mod 4 = 0) and (A mod 100 <> 0) or (A mod 400 =0)) then writeln('El anyo es bisiesto ')
	
	else writeln('El anyo no es bisiesto');
	
end.

