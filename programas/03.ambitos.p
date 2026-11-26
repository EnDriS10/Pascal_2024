{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

{
	Programa absurdo que ademas viola las normas
	para ayudar con la comprensión del uso de variables.
	fpc -g -oa.out $% && a.out
}

program ambitos;

procedure proc1(n: integer; var n2: integer);
begin
	n2 := 2*n*n2;
end;

procedure proc2(n: integer);
begin
	proc1(3, n);
	writeln(sin(n));
end;

var
	n: integer;
begin
	readln(n);
	proc2(n);
end.
