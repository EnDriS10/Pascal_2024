{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Expresiones varias con char

	fpc -g -oa.out $% && a.out
	rm -f $.o a.out
}

program cars;

const
	Letra: char = 'c';

begin
	writeln(Letra);
	writeln('tras b? ', Letra > 'b');
	writeln('es c? ', Letra = 'c');
	writeln('es min? ', (Letra >= 'a') and (Letra <= 'z'));
	writeln('es num? ', (Letra >= '0') and (Letra <= '0'));
	writeln('pos? ', ord(Letra));
	writeln('letra en pos 100? ', chr(100));
	writeln('a mayus: ', chr(ord(Letra)-ord('a')+ord('A')));
	writeln('pred= ', pred(Letra));
	writeln('succ= ', succ(Letra));
	writeln('succ(4)= ', succ(4));	{ mejor 4+1 }
	{ sin sentido: 3 < '0' }
	{ absurdo: varias razones: ord('A') > ord('a') }
end.
