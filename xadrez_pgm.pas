program cria_xadrez;

type matriz= array[1..1000,1..1000] of integer;
var m: matriz;linhas,colunas,lado_quadrado: longint;

procedure imprime_matriz(var m: matriz; linhas, colunas: integer);
var l,j: integer;
begin
for l:= 1 to linhas do
	begin
	for j:=1 to colunas do
		write(m[l,j],' ');
	writeln();
	end;
end;

function cria_matriz_xadrez(linhas,colunas,lado_qadrado: longint): matriz;
var pos_linha,pos_coluna,cor,i,j: longint;
begin
pos_linha:=1;
pos_coluna:=1;
cor:=0;
for i:= 1 to linhas do
	begin
	for j:=1 to colunas do
		begin
		if (pos_coluna > lado_quadrado) then
			begin
			pos_coluna:=1;
			if cor = 1 then
				cor:=0
			else
				cor:=1;
			end;
		m[i,j]:=cor;
		pos_coluna:=pos_coluna+1;
		end;
	pos_linha:= pos_linha+1;
	pos_coluna:=1;
	{
	if linhas mod 2 <> 0 then
		begin
		if cor = 0 then
			cor:=1
		else
			cor:=0;
		end;
	}
	if pos_linha > lado_quadrado then
		begin
		pos_linha:=1;
		if cor = 1 then
			cor:=0
		else
			cor:=1;
		end;
	end;
cria_matriz_xadrez:=m;
end;
		
		

begin
writeln('esse programa vai criar um pgm de um tabuleiro de xadrez, copie a saida do programa em um arquivo .pgm para visualizar.');
writeln('escreva o tamanho do tabuleiro de xadrez (linhas e colunas):');
read(linhas);
read(colunas);
writeln('escreva o tamanho do lado dos quadrados:');
read(lado_quadrado);
writeln();
writeln();
m:= cria_matriz_xadrez(linhas,colunas,lado_quadrado);
writeln('P2');
writeln(colunas, ' ', linhas);
writeln('1');
imprime_matriz(m,linhas,colunas);
end.



//1 eh branco
//0 eh preto
