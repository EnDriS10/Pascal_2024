{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program Fibo;


//Usando procedure


procedure Fibo(var num: integer);
	begin
		writeln('Escribe un numero');
		readln(num)
	end;


function Fibonn(n: integer): integer;
	begin
	 Fibonn := 1;
	for i:=1 to n do:
		Fibonn := Fibonn(i) + Fibonn(0);
	end;

begin
	Fibo(a);
	writeln(Fibonn(a))

end.

