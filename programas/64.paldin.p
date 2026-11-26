{$mode objfpc}{$H-}{$I+}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Palabras dinamicas

	fpc -g -oa.out $% &&   a.out <guide
}

program paldin;

const
	Tab: char = '	';
type
	TipoStr = ^TipoNodoStr;
	TipoNodoStr = record
		c: char;
		sig: TipoStr;
	end;

procedure fatal(msg: string);
begin
	writeln('error fatal: ', msg);
	halt(1);
end;

procedure vaciarstr(var str: TipoStr);
begin
	str := nil;
end;

procedure appcar(var str: TipoStr; c: char);
var
	nodo, p: ^TipoNodoStr;
begin
	new(nodo);
	nodo^.c := c;
	nodo^.sig := nil;
	if str = nil then begin
		str := nodo;
	end
	else begin
		p := str;
		while p^.sig <> nil do begin
			p := p^.sig;
		end;
		p^.sig := nodo;
	end;
end;

procedure disposestr(var str: TipoStr);
var
	p: ^TipoNodoStr;
begin
	while str <> nil do begin
		p := str;
		str := str^.sig;
		dispose(p);
	end;
end;

function longstr(str: TipoStr): integer;
var
	n: integer;
begin
	n := 0;
	while str <> nil do begin
		str := str^.sig;
		n := n+1;
	end;
	result := n;
end;


function esblanco(c: char): boolean;
begin
	result := (c = ' ') or (c = Tab);
end;

procedure leerstr(var entrada: Text; var str: TipoStr);
var
	c: char;
	haypalabra: boolean;
begin
	vaciarstr(str);
	haypalabra := false;
	while not eof(entrada) and not haypalabra do begin
		if eoln(entrada) then begin
			readln(entrada);
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
	end;
	while haypalabra do begin
		appcar(str, c);
		if eof(entrada) or eoln(entrada) then begin
			haypalabra := false;
		end
		else begin
			read(entrada, c);
			haypalabra := not esblanco(c);
		end;
	end;
end;

procedure escrstr(str: TipoStr);
begin
	while str <> nil do begin
		write(str^.c);
		str := str^.sig;
	end;
end;

procedure escrstrln(str: TipoStr);
begin
	escrstr(str);
	writeln();
end;

function strtostring(str: TipoStr): string;
var
	n: integer;
	s: string;
begin
	n := 0;
	setlength(s, n);
	while str <> nil do begin
		n := n+1;
		setlength(s, n);
		s[n] := str^.c;
		str := str^.sig;
	end;
	result := s;
end;

procedure leerstring(var entrada: text; var s: string);
	var str: TipoStr;
begin
	leerstr(entrada, str);
	s := strtostring(str);
	disposestr(str);
end;

procedure leerint(var entrada: text;
				var n: integer; var ok: boolean);
var
	s: string;
	pos: integer;
begin
	ok := not eof();
	if ok then begin
		leerstring(entrada, s);
		val(s, n, pos);
		ok := pos = 0;
	end;
end;

var
	n: integer;
	ok: boolean;
begin
	repeat
		leerint(input, n, ok);
		if ok then begin
			writeln(n);
		end;
	until eof();
end.
