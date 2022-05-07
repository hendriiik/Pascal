program faciooooo;

var linha,coluna : integer;
cor: string;

begin
read(linha,coluna);

if (linha mod 2 <> 0) then begin
    cor:='BRANCO';
    if (coluna mod 2 = 0) then cor:='PRETO';
    end
    
else begin
    cor:='PRETO';
    if (coluna mod 2 = 0) then cor:='BRANCO';
    end;
    
writeln(cor);
end.

