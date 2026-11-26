{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Minimo y Maximo hasta 0 en la entrada?
	fpc -g -oa.out $% && echo 8 10 11 2 0 | a.out
}

program minymax;
const
	Fin: integer = 0;
var
	min, max, num: integer;
begin
	read(num);
	if num = 0 then begin
		writeln('ninguno');
	end
	else begin
		min := num;
		max := num;
		repeat
			read(num);
			if num <> Fin then begin
				if num < min then begin
					min := num;
				end;
				if num > max then begin
					max := num;
				end;
			end;
		until num = Fin;
	end;
	writeln('min = ', min);
	writeln('max = ', max);
end.
