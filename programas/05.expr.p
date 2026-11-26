{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Expresiones varias

	fpc -g -oa.out $% && a.out
	rm -f $.o a.out
}

program expresiones;

uses math;

const
	Pi: real = 3.1415;
	Radio: real = 44.3;

begin
	writeln('long circunf = ', 2*Pi*Radio);
	writeln('area circulo = ', Pi*sqr(Radio));
	writeln('vol esfera = ', 3/4*Pi*Intpower(Radio, 3));
	writeln('2 ** 3 = ', 2 ** 3);
	{ no existe: Intpower(Radio, 3.0), ni Radio ** 3.0 }
	writeln('es 2.0 = ', sqrt(sqr(2.0)));
	writeln('es 2.0 = ', sqrt(sqr(2)));
	writeln('3/4 = ', 3/4);
	writeln('4.0/3.0 = ', 4.0/3.0 :0:3);
	writeln('4.0/3.0 = ', 4.0/3.0 :10:3);
	writeln('4 div 3 = ', 4 div 3);
	writeln('4 div 3 = ', 4 div 3);
	writeln('4 mod 3 = ', 4 mod 3);
	writeln('(4+2)/2 = ', (4+2)/2 :0:3);
	writeln(False or (True and False) or not False);
	{ no existe: 3.0 div 4.0 }
end.
