{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program pamcaso;


const
	Pi:real = 3.1416;

function longitud(r: real): real;
begin
	result := 2.0 * Pi * r;
end;
	
begin
	writeln(longitud(4.0):0:4);	

end.
