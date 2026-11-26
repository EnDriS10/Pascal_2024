program Ej;

const
	letra_1 : char = 'a';
	letra_2 : char = 'b';


begin


	if ( letra_1 < letra_2 ) then
		writeln('Las letras estan ordenadas alfabeticamente')
	else if ( letra_1 = letra_2) then
		writeln('Las letras son iguales')
	
	else
		writeln('Las letras no estan ordenadas alfabeticamente');

end.
