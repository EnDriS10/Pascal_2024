{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Dibujar triangulo
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program triangulo;

const
	Tinta: char = '*';

procedure escrfilatriangulo(ancho: integer);
var
	i: integer;
begin
	for i := 1 to ancho do begin
		write(Tinta);
	end;
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

const
	Alto: integer = 5;

begin
	escrtriangulo(Alto);
end.
