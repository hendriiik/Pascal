program testa_binario;
var n: longint;

function eh_binario(n: longint): boolean;
var algarismo: integer;
begin
eh_binario:= true;
algarismo:=0;
while n <> 0 do
	begin
	algarismo:= n mod 10;
	if (algarismo <> 0) and (algarismo <> 1) then
		eh_binario:= false;
	n:= n div 10;
	end;
end;

begin
    read (n);
    if eh_binario (n) then
        writeln ('sim')
    else
        writeln ('nao');
end.
