program matriz_permutacao;

type matriz = array[1..100,1..100] of integer;
var linhas,colunas,linha_atual: longint; eh_permut: boolean; m: matriz;

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

function testa_linha_permut(m: matriz; linha_atual,colunas: longint): boolean;
var zeros,uns,i: longint;
begin
testa_linha_permut:= true;
zeros:=0;
uns:=0;
for i:= 1 to colunas do
	begin
	if m[linha_atual, linha_atual] <> 1 then
		testa_linha_permut:= false;
	if m[linha_atual,i] = 1 then
		uns:=uns+1
	else 
		if m[linha_atual,i] = 0 then
			zeros:=zeros+1;
	end;
if zeros<> colunas - 1 then 
	testa_linha_permut:= false;
if uns <> 1 then
	testa_linha_permut:= false;
end;
			

begin
read(linhas);
colunas:= linhas;
m:= le_matriz(linhas,colunas);
eh_permut:= true;
linha_atual:=1;
while (linha_atual<= linhas) and (eh_permut = true) do
	begin
	eh_permut:= testa_linha_permut(m,linha_atual,colunas);
	linha_atual:=linha_atual+1;
	end;

if eh_permut = false then
	writeln('nao')
else
	writeln('sim');
end.

	
	
