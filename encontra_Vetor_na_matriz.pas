program caca_vetor;

type vetor= array[1..100] of integer;
type matriz = array[1..100,1..100] of integer;
var linhas,colunas,tam_vet,l_atual,c_atual: integer;
    m: matriz;
    vet: vetor;
    eh: boolean;

function procura_esq_dir(var m: matriz; linhas,colunas: integer; var vet: vetor; tam_vet,l_atual,c_atual: integer): boolean;
var eh: boolean; i: integer;
begin
eh:= true;
if c_atual + tam_vet-1 > colunas then
	eh:= false

else begin
	for i:= 1 to tam_vet do
		begin
		if m[l_atual,c_atual+i-1] <> vet[i] then
			eh:= false;
		end;
	end;
procura_esq_dir:= eh;
end;


function procura_dir_esq(var m: matriz; linhas,colunas: integer; var vet: vetor; tam_vet,l_atual,c_atual: integer): boolean;
var eh: boolean; i: integer;
begin
eh:= true;
if c_atual - tam_vet+1 < 1 then
	eh:= false

else begin
	for i:=1 to tam_vet do
		begin
		if m[l_atual,c_atual - i+1] <> vet[i] then
			eh:= false
		end;
	end;
procura_dir_esq:= eh;
end;


function procura_cima_baixo(var m: matriz; linhas,colunas: integer; var vet: vetor; tam_vet,l_atual,c_atual: integer): boolean;
var eh: boolean; i: integer;
begin
eh:= true;
if l_atual +tam_vet -1 > linhas then
	eh:= false

else begin
	for i:=1 to tam_vet do
		begin
		if m[l_atual +i-1,c_atual] <> vet[i] then
			eh:= false;
		end;
	end;
procura_cima_baixo:= eh;
end;


function procura_baixo_cima(var m: matriz; linhas,colunas: integer; var vet: vetor; tam_vet,l_atual,c_atual: integer): boolean;
var eh: boolean; i: integer;
begin
eh:= true;
if l_atual - tam_vet + 1 < 1 then
	eh:= false
else begin
	for i:=1 to tam_vet do
		begin
		if m[l_atual-i+1,c_atual] <> vet[i] then
			eh:= false;
		end;
	end;
procura_baixo_cima:= eh;
end;

function le_matriz(linhas,colunas: integer): matriz;
var i,j, elemento: longint;
begin
for i:= 1 to linhas do
	for j:=1 to colunas do
	begin
		read(elemento);
		le_matriz[i,j]:= elemento;
	end;
end;

function le_vetor(tamanho: integer): vetor;
var i: integer;
begin for i:=1 to tamanho do
	read(le_vetor[i]);
end;



begin
writeln('Quantas linhas e colunas tem a matriz? ');
read(linhas);
read(colunas);
writeln('Digite a matriz');
m:= le_matriz(linhas,colunas);
writeln('Qual o tamanho do vetor a ser encontrado? ');
read(tam_vet);
writeln('Digite o vetor: ');
vet:= le_vetor(tam_vet); 
writeln('Em que linha e coluna devemos procurar?');
read(l_atual);
read(c_atual);
eh:= false;
if procura_esq_dir(m,linhas,colunas,vet,tam_vet,l_atual,c_atual) = true then
	eh:= true

else if procura_dir_esq(m,linhas,colunas,vet,tam_vet,l_atual,c_atual) = true then
	eh:= true
	
     else if procura_cima_baixo(m,linhas,colunas,vet,tam_vet,l_atual,c_atual) = true then
		eh:= true
	  else if procura_baixo_cima(m,linhas,colunas,vet,tam_vet,l_atual,c_atual) = true then
			eh:= true
		else eh:= false;

if eh = true then
	writeln('sim')
else 
	writeln('nao')
end.
