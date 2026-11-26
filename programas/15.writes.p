program writes;

const
	A: integer = 10;
	B: integer = -3;
begin
	if A > B then begin
		write('el numero ');
		write(A);
		write(' es mayor que ');
		write(B);
		writeln();
	end
	else begin
		write('el numero ');
		write(B);
		write(' es mayor que ');
		write(B);
		writeln();
	end;
	
end.
