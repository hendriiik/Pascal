program kuruwayna;

type matriz= array[1..100,1..100] of integer;
var linhas,colunas,linha_1,linha_2,coluna_1,coluna_2: longint; iguais: boolean; m: matriz;

procedure prox_indice(var linha: longint; var coluna:longint; tam_coluna: longint);
begin
if coluna = tam_coluna then
	begin
	linha:=linha+1;
	coluna:= 1;
	end
else 
	coluna:= coluna+1
end;


function le_matriz(linhas: integer; colunas: integer): matriz;
var i: integer; elemento,linha_atual,coluna_atual: longint; mat: matriz;
begin
linha_atual:=1;
coluna_atual:=1;
for i:= 1 to linhas*colunas do
	begin
	read(elemento);
	mat[linha_atual,coluna_atual]:= elemento;
	prox_indice(linha_atual,coluna_atual, colunas);
	end;
le_matriz:= mat;
end;


begin
read(linhas);
read(colunas);
m:= le_matriz(linhas, colunas);
iguais:= false;
linha_1:= 1;
coluna_1:= 1;
linha_2:=1;
coluna_2:= 1;
prox_indice(linha_2, coluna_2, colunas);
while (linha_1+ coluna_1 < linhas+colunas) and (iguais= false) do
	begin
	while (linha_2 <= linhas)  and (iguais= false) do
		begin
		if m[linha_1,coluna_1] = m[linha_2,coluna_2] then
			iguais:= true;
		prox_indice(linha_2,coluna_2,colunas);
		end;
	prox_indice(linha_1,coluna_1,colunas);
	linha_2:= linha_1;
	coluna_2:= coluna_1;
	prox_indice(linha_2,coluna_2,colunas);
	end;
if iguais = true then
	writeln('sim')
else
	writeln('nao');
end.
		
		
