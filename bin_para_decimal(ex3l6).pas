program converte;
var n: longint;

function converte_em_decimal(n: longint):longint;
var algarismo,multiplica: integer;
convertido: longint;
begin
convertido:=0;
multiplica:=1;
	while n <> 0 do
		begin
		algarismo:= n mod 10;
		n:= n div 10;
		convertido:= convertido + algarismo*multiplica;
		multiplica:=multiplica*2;
		end;
	converte_em_decimal:= convertido;
end;
	
begin
    read (n);
    writeln (converte_em_decimal (n));
end.
