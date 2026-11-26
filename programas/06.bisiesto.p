{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Es bisiesto con expresiones

	fpc -g -oa.out $% && a.out
	rm -f $.o a.out
}

program bisiesto;

const
	Anyo: integer = 1940;

begin
	writeln((Anyo mod 4 = 0) and
		(Anyo mod 100 <> 0) or
		(Anyo mod 400 = 0));
end.
