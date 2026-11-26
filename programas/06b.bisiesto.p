{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Es bisiesto con una constante

	fpc -g -oa.out $% && a.out
	rm -f $.o a.out
}

program bisiesto;

const
	EsBisiesto: boolean = (1900 mod 4 = 0) and
		(1900 mod 100 <> 0) or
		(1900 mod 400 = 0);

begin
	writeln(EsBisiesto);
end.
