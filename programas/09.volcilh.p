{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	volumen cilindro hueco
	fpc -g -oa.out $% && a.out
}
program fact;

const
	Pi: real = 3.1415926;

function areacirculo(r: real): real;
begin
	result := Pi*sqr(r);
end;

function areacorona(rmin: real; rmax: real): real;
begin
	result := areacirculo(rmax) - areacirculo(rmin);
end;

{
  volumen de un cilindro de altura alt y radio rmax
  taladrado por otro cilindro de radio rmin
}
function volcilhueco(rmin, rmax, alt: real): real;
begin
	result := areacorona(rmin, rmax) * alt;
end;

const
	Rmin: real = 3.2;
	Rmax: real = 4.3;
	Alt: real = 2.8;

begin
	writeln('v = ', volcilhueco(Rmin, Rmax, Alt) :0:3);
end.
