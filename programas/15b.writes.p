program writes;

const
	A: integer = 10;
	B: integer = -3;
begin
	write('el numero ');
	if A > B then begin
		write(A);
		write(' es mayor que ');
		write(B);
		writeln();
	end
	else begin
		write(B);
		write(' es mayor que ');
		write(B);
		writeln();
	end;
	
end.
