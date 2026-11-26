{$mode objfpc}{$H-}{$R+}{$T+}{$I+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Jugar con EOLN
	fpc -g -oa.out $% && echo ahol | a.out
}

program leercars;

var
	entrada: text;	{ basicamente file of char }
	c: char;
begin
	assign(entrada, 'datos');
	reset(entrada);
	read(entrada, c);
	writeln('[', c, '] ', eoln(entrada));
	read(entrada, c);
	writeln('[', c, '] ', eoln(entrada));
	readln(entrada);
	read(entrada, c);
	writeln('[', c, '] ', eoln(entrada));
	read(entrada, c);
	writeln('[', c, '] ', eoln(entrada));
	close(entrada);
end.
