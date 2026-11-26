{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
{
	valor de digito hexadecimal
	fpc -g -oa.out $% && a.out
}
program valorhex;

function valordigitohex(digito: char): integer;
begin
	case digito of
	'0'..'9':
		result := ord(digito)-ord('0');
	'a'..'f':
		result := 10+ord(digito)-ord('a');
	'A'..'F':
		result := 10+ord(digito)-ord('A');
	otherwise
		writeln('ERROR: valordigitohex: digito: ', digito);
		halt(1);
		result := 0;
	end;
end;

begin
	writeln(valordigitohex('Z'));
end.
	