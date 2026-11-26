{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Geometria
	fpc -g -oa.out $% && echo Dom | a.out
}
program geometria;

type
	TipoPunto = record
		x,y: integer;
	end;

	TipoRect = record
		min, max: TipoPunto;
	end;

	TipoCirculo = record
		centro: TipoPunto;
		radio: integer;
	end;

	TipoElipse = record
		centro: TipoPunto;
		radiomin, radiomax: integer;
	end;
const
	Origen: TipoPunto = (x: 0; y: 0);

begin
end.
