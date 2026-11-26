{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Solucionar ecuacion de grado 2

	fpc -g -oa.out $% && echo 30 8 2 | a.out
}
program ec2;

const
	Eps: real = 0.00001;
type
	TipoEc = record
		a, b, c: real;	{ ax2+xb+c=0 }
	end;

	TipoClaseSol = (SinSol, SolReal, SolImag);

	TipoSol = record
		clase: TipoClaseSol;
		x1, x2: real;
		re, im: real;
	end;


const
	NoSol: TipoSol = (
		clase: SinSol;
		x1: 0.0;
		x2: 0.0;
		re: 0.0;
		im: 0.0;
	);

procedure leerec(var ec: TipoEc);
begin
	read(ec.a);
	read(ec.b);
	read(ec.c);
end;

procedure escrec(ec: TipoEc);
begin
	writeln(ec.a:0:2, 'x2 + ', ec.b:0:2, 'x + ', ec.c:0:2, ' = 0');
end;

function discriminante(ec: TipoEc): real;
begin
	result := sqr(ec.b) - 4.0*ec.a*ec.c;
end;

function resolverreal(ec: TipoEc): TipoSol;
var
	sol: TipoSol;
begin
	sol.clase := SolReal;
	sol.x1 := (-ec.b + sqrt(discriminante(ec))) / (2.0*ec.a);
	sol.x2 := (-ec.b - sqrt(discriminante(ec))) / (2.0*ec.a);
	result := sol;
end;

function resolverim(ec: TipoEc): TipoSol;
var
	sol: TipoSol;
begin
	sol.clase := SolImag;
	sol.re := -ec.b / (2.0*ec.a);
	sol.im := sqrt(-discriminante(ec)) / (2.0*ec.a);
	result := sol;
end;

function tienesol(ec: TipoEc): boolean;
begin
	result := ec.a <> 0;
end;

function tienesolreal(ec: TipoEc): boolean;
begin
	result := tienesol(ec) and (discriminante(ec) >= 0.0);
end;

function resolver(ec: TipoEc): TipoSol;
begin
	if tienesolreal(ec) then begin
		result := resolverreal(ec);
	end
	else if tienesol(ec) then begin
		result := resolverim(ec);
	end
	else begin
		result := NoSol;
	end
end;

procedure escrsol(sol: TipoSol);
begin
	case sol.clase of
	Solreal:
		if abs(sol.x1-sol.x2) < Eps then begin
			writeln('x = ', sol.x1:0:2);
		end
		else begin
			writeln('x1 = ', sol.x1:0:2);
			writeln('x2 = ', sol.x2:0:2);
		end;
	SolImag:
		begin
			writeln('x1 = ', sol.re:0:2, '+', sol.im:0:2, 'i');
			writeln('x1 = ', sol.re:0:2, '-', sol.im:0:2, 'i');
		end;
	SinSol:
		writeln('sin solucion');
	end;
end;

var
	ec: TipoEc;
begin
	leerec(ec);
	escrsol(resolver(ec));
end.
