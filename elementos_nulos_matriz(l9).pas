program elemenulos;

type matriz= array[1..100,1..100] of integer;
var linhas, colunas, linhas_zero, colunas_zero: longint; mat: matriz;


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

function linhas_zeradas(var mat: matriz; linhas, colunas: longint): longint;
var i,j: longint; eh_zero: boolean;
begin
linhas_zeradas:= 0;
for i:=1 to linhas do 
	begin
	eh_zero:= true;
	for j:=1 to colunas do 
		begin
		if mat[i,j]<> 0 then
			eh_zero:= false;
		end;
	if eh_zero = true then
		linhas_zeradas:= linhas_zeradas + 1;
	end;
end;

function colunas_zeradas(var mat: matriz; linhas, colunas: longint): longint;
var i,j: longint; eh_zero: boolean;
begin
colunas_zeradas:=0;
for j:=1 to colunas do 
	begin
	eh_zero:= true;
	for i:=1 to linhas do
		begin
		if mat[i,j]<> 0 then
			eh_zero:= false;
		end;
	if eh_zero= true then
		colunas_zeradas:= colunas_zeradas + 1;
	end;
end;

begin
read(linhas);
read(colunas);
mat:= le_matriz(linhas,colunas);
linhas_zero:= linhas_zeradas(mat,linhas,colunas);
colunas_zero:= colunas_zeradas(mat,linhas, colunas);
writeln('linhas: ', linhas_zero);
writeln('colunas: ', colunas_zero);
end.
