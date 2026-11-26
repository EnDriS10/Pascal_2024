{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Dibujar triangulo
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program triangulo;

const
	Tinta: char = '#';
	Papel: char = ' ';

procedure escrn(car: char; n: integer);
var
	i: integer;
begin
	for i := 1 to n do begin
		write(car);
	end;
end;

procedure escrfilatriangulo(ancho: integer);
begin
	escrn(Tinta, ancho);
	writeln();
end;

procedure escrfilatrianguloinv(fila, ancho: integer);
begin
	escrn(Tinta, ancho-fila+1);
	writeln();
end;

procedure escrfilatriangulosim(fila, ancho: integer);
begin
	escrn(Papel, (ancho-fila+1));
	escrn(Tinta, 2*fila-1);
	writeln();
end;

procedure escrtriangulo(alto: integer);
var
	fila: integer;
begin
	for fila := 1 to alto do begin
		escrfilatriangulo(fila);
	end;
end;

procedure escrtrianguloinv(alto: integer);
var
	fila: integer;
begin
	for fila := 1 to alto do begin
		escrfilatrianguloinv(fila, alto);
	end;
end;

procedure escrtriangulosim(alto: integer);
var
	fila: integer;
begin
	for fila := 1 to alto do begin
		escrfilatriangulosim(fila, alto);
	end;
end;

procedure escrtriangulosiminv(alto: integer);
var
	fila: integer;
begin
	for fila := alto downto 1 do begin
		escrfilatriangulosim(fila, alto);
	end;
end;

const
	Alto: integer = 5;

begin
	escrtriangulo(Alto);
	writeln();
	escrtrianguloinv(Alto);
	writeln();
	escrtriangulosim(Alto);
	writeln();
	escrtriangulosiminv(Alto);
end.
