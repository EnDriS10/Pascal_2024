{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Copiar un fichero en la salida

	fpc -g -oa.out $% &&  a.out</dev/null
}

program copia;

procedure copiar(var entrada, salida: Text);
var
	c: char;
begin
	while not eof(entrada) do begin
		if eoln(entrada) then begin
			readln(entrada);
			writeln(salida);
		end
		else begin
			read(entrada, c);
			write(salida, c);
		end;
	end;
end;

var
	entrada: Text;
begin
	assign(entrada, 'texto');
	reset(entrada);
	copiar(entrada, output);
	close(entrada);
end.
