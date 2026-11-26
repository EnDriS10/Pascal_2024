{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{Hecho por Cesar Endris Acosta}

program tarea;

const
	Esp: char =' ';
	Tab: char ='	';

function EsBlanco(c:char): Boolean;
begin
	result:= c = Esp or c = Tab;
end;

procedure addcar (var pal: string; c: char);
var
	n: integer;
begin
	n:= lenth(pal);
	setlenth(pal, n+1);
	pal[n+1]:=c;	
end;

procedure

var
	haypal: boolean;
	

begin
	
	
		
end;

var
fich: text;

begin
assign(fich, 'datos.txt');
reset(fich);


close(fich);

end.
