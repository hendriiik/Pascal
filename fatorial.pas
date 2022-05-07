program fat;
var a,b: longint;


function fatorial (numero: longint): longint;
var cont, soma: longint;
begin
soma:=1;
for cont:=1 to numero do
soma:=soma*cont;
fatorial:= soma;
end;

begin
read(a);
b:= fatorial(a);
write('o fatorial eh: ',b);
end.
