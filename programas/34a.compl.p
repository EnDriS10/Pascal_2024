{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Complejos

	fpc -g -oa.out $% && echo 30 8 2 | a.out
}
program compl;

type
	TipoCompl = record
		re, im: real;
	end;

function nuevocompl(re, im: real): TipoCompl;
var c: TipoCompl;
begin
	c.re := re;
	c.im := im;
	result := c;
end;

procedure leercompl(var c: TipoCompl);
begin
	read(c.re);
	read(c.im);
end;

procedure escrcompl(c: TipoCompl);
begin
	if c.im > 0.0 then begin
		write(c.re:0:2, '+', c.im:0:2, 'i');
	end
	else if c.im = 0.0 then begin
		write(c.re:0:2);
	end
	else begin
		write(c.re:0:2, '-', c.im:0:2, 'i');
	end;

end;

procedure escrcomplln(c: TipoCompl);
begin
	escrcompl(c);
	writeln();
end;

var
	c: TipoCompl;
begin
	leercompl(c);
	escrcomplln(c);
end.
