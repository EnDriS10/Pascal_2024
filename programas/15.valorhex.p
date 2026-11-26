{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	valor de digito hexadecimal
	fpc -g -oa.out $% && a.out
}
program valorhex;

function valordigitohex(digito: char): integer;
begin
	{ mas ramas de las necesarias para que tengas ejemplos }
	case digito of
	'0':
		result := 0;
	'1'..'9':
		result := ord(digito)-ord('0');
	'A','B','C'..'F':
		begin
			result := 10+ord(digito)-ord('A');
		end;
	'a'..'f':
		result := 10+ord(digito)-ord('a');
	otherwise
		result := 0;
	end;
end;

begin
	writeln(valordigitohex('E'));
end.
	