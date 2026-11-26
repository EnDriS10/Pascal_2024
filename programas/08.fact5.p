{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	factorial de 5
	fpc -g -oa.out $% && a.out
}
program fact;


function fact5(): real;		{mejor esta}
begin
	result := 5*4*3*4*1;
end;

				{pero tambien podemos...}
function otrofact5: real;
begin
	result := 5*4*3*4*1;
end;

begin
	writeln(fact5());	{mejor usar esta}
	{ o bien...}
	writeln(fact5);

end.
