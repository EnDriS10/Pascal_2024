{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program raiz;

uses math;

var
  numero: Real;
  raiz: Real;

begin
  writeln('Ingrese un número para calcular su raíz cuadrada:');
  readln(numero);
  
  if numero < 0 then
    writeln('Error: No se puede calcular la raíz cuadrada de un número negativo.')
  else
  begin
    raiz := Sqrt(numero);
    writeln('La raíz cuadrada de ', numero:0:2, ' es ', raiz:0:2);
  end;
  
  readln; // Pausa para ver el resultado
end.

