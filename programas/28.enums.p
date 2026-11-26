{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Enumerados
	fpc -g -oa.out $% && echo Vie | a.out
}
program enums;

type
	TipoDiaSem = (Lun, Mar, Mie, Jue, Vie, Sab, Dom);
	TipoDiaLab = Lun..Sab;

	TipoValorCarta = (Uno, Dos, Tres, Cuatro, Cinco, Seis, Siete,
				Sota, Caballo, Rey);

	TipoDigitoRom = (RomI, RomV, RomX, RomL, RomC, RomD, RomM);

const
	Mil = RomM;

begin
end.
