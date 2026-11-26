{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Resolver ecuacion de 2 grado
	fpc -g -oa.out $% && echo 5 38  7 | a.out
}
program ec2;

uses math;

const
	Eps: float = 0.00001;

procedure leerec(var a, b, c: real);
begin
	read(a);
	read(b);
	read(c);
end;

function discriminante(a, b, c: real): real;
begin
	result := b ** 2 - 4.0 * a * c;
end;

function tienesol(a, b, c: real): boolean;
begin
	result := (discriminante(a, b, c) >= 0.0) and (a <> 0.0);
end;

procedure solucionarec(a, b, c: real; var x1, x2: real);
begin
	x1 := (-b + sqrt(discriminante(a, b, c))) / (2.0 * a);
	x2 := (-b - sqrt(discriminante(a, b, c))) / (2.0 * a);
end;

procedure escrsol(a, b, c: real; x1, x2: real);
begin
	writeln(a:0:2, '*x**2 + ', b:0:2, '*x +', c:0:2, ' = 0');
	if abs(x1-x2) < Eps then begin
		writeln('	x = ', x1:0:2);
	end
	else begin
		writeln('	x1 = ', x1:0:2);
		writeln('	x2 = ', x2:0:2);
	end;
end;

var
	a, b, c: real;	{ ax2+xb+c=0 }
	x1, x2: real;
begin
	leerec(a, b, c);
	if tienesol(a, b, c) then begin
		solucionarec(a, b, c, x1, x2);
		escrsol(a, b, c, x1, x2);
	end
	else begin
		writeln('sin solucion');
	end;
end.
