{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	longitud circunferencia con funciones
	fpc -g -oa.out $% && a.out
}
program circunf;

{constantes universales}
const
	Pi: real = 3.14;

function longcircunf(r: real): real;
begin
	result := 2.0*Pi*r;		{mejor usar esta forma}
end;

function areacirculo(r: real): real;
begin
	areacirculo := Pi*sqr(r);	{igual que result :=...}
end;

{constantes de prueba aqui}
const
	R: real = 45.0;
begin
	writeln(longcircunf(R));
	writeln(areacirculo(R));
end.
