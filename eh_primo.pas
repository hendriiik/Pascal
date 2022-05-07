program facinh;

var numero,cont,primo: longint;

begin;
read(numero);
cont:=3;
primo:=1;
if (numero mod 2 = 0) then primo:=0;
while (sqrt(numero)>= cont) and (primo<>0) do begin
if (numero mod cont = 0) then primo:=0;
cont:=cont+2;
end;
if (primo=1) then write('Primo')
else write('Nao Primo');
end.
