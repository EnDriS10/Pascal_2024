{
	saludar al numero pi
	fpc -g -oa.out $% && a.out
}
program holapi;
const
	Pi: real = 3.14;
begin
	write('hola ');
	write(Pi);
	write('!');
	writeln();
end.
