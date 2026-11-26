{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Son todos 0?
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program todos0;

const
	NumNums = 4;	{ lamentablemente, no funciona :integer = 3 }

type
	TipoIndNums = 1..NumNums;
	TipoNums = array[TipoIndNums] of integer;

function sontodos(nums: TipoNums; n: integer): boolean;
var
	loson: boolean;
	i: integer;
begin
	{ como buscar(nums, <not n>, pos, esta); result := not esta }
	i := 1;
	loson := true;
	while (i <= NumNums) and loson do begin
		if nums[i] <> n then begin
			loson := false;
		end
		else begin
			i := i + 1;
		end;
	end;
	result := loson;
end;

const
	NumsPrueba: TipoNums = (4, 3, 0, 7);
	Num: integer = 0;
begin
	writeln(sontodos(NumsPrueba, Num));
end.
