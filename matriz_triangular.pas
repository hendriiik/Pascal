program matriz_triang;

type matriz= array[1..100,1..100] of integer;
var resposta: boolean;mat: matriz;n: integer;


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

function triangular_superior(var mat: matriz; tamanho: integer):boolean;
var cont_c, cont_l, diagonal: integer;
begin
triangular_superior:= true;
diagonal:=1;
while (diagonal <= tamanho - 1) and (triangular_superior= true) do
	begin
	cont_l:=diagonal;
	cont_c:= diagonal+1;
	while  tamanho >= cont_c do
		begin 
		if mat[cont_l,cont_c] <> 0 then
			triangular_superior:= false;
		cont_c:= cont_c + 1;
		end;
	diagonal:= diagonal + 1;
	end;
end;
	
	
function triangular_inferior(var mat: matriz; tamanho: integer):boolean;
var cont_c, cont_l, diagonal: integer;
begin
triangular_inferior:= true;
diagonal:=2;
cont_l:=1;
while (diagonal <= tamanho) and (triangular_inferior= true) do
	begin
	cont_c:=1;
	cont_l:=cont_l+1;
	while  diagonal > cont_c do
		begin 
		if mat[cont_l,cont_c] <> 0 then
			triangular_inferior:= false;
		cont_c:= cont_c + 1;
		end;
	diagonal:= diagonal + 1;
	end;
end;






begin
read(n);
mat:= le_matriz(n,n);
resposta:= triangular_superior(mat,n);
if resposta <> true then
	resposta:= triangular_inferior(mat,n);
if resposta = true then
	writeln('sim')
else writeln('nao');
end.
