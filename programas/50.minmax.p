{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Minimo y Maximo?
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program minymax;

const
	NumNums = 4;

type
	TipoIndNums = 1..NumNums;
	TipoNums = array[TipoIndNums] of integer;

function minimo(nums: TipoNums): integer;
var
	min, i: integer;
begin
	min := nums[1];
	for i := 2 to NumNums do begin
		if nums[i] < min then begin
			min := nums[i];
		end;
	end;
	result := min;
end;

function posmaximo(nums: TipoNums): integer;
var
	posmax, i: integer;
begin
	posmax := 1;
	for i := 2 to NumNums do begin
		if nums[i] > nums[posmax] then begin	 { > o >=? }
			posmax := i;
		end;
	end;
	result := posmax;
end;

const
	NumsPrueba: TipoNums = (-2, 7, -2, 7);
var
	pos: integer;
begin
	writeln('min = ', minimo(NumsPrueba));
	pos := posmaximo(NumsPrueba);
	writeln('max = nums[', pos, '] = ', NumsPrueba[pos]);
end.
