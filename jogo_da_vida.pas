program jogodavida;

uses crt;

type matriz= array[0..51,0..51] of integer;

var geracao, nova_geracao: matriz;
	linhas,colunas, geracoes,i: integer;
	enter: char; //!!!!

procedure le_matriz(var geracao: matriz; linhas,colunas: integer);
var i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		read(geracao[i,j]); //!!!
end;

procedure cria_borda( var m: matriz; linhas,colunas: integer);
var i: integer;
begin
for i:=0 to linhas+1 do
	begin
	m[i,0]:=-9;
	m[i,colunas+1]:=-9;
	end;
for i:=1 to colunas do
	begin
	m[0,i]:=-9;
	m[linhas+1,i]:=-9;
	end;
end;

procedure imprime_matriz(var m: matriz; linhas,colunas: integer);
var i,j: integer;
begin
for i:=1 to linhas do
	begin
	for j:=1 to colunas do
		write(m[i,j],' ');
	writeln();
	end;
end;

function quantos_vizinhos( var m: matriz; linha,coluna: integer): integer;
begin
quantos_vizinhos:=0;
if m[linha-1,coluna-1] = 1 then
	quantos_vizinhos:= quantos_vizinhos+1;
if m[linha-1,coluna] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha-1,coluna+1] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha,coluna-1] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha,coluna+1] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha+1,coluna-1] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha+1,coluna] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
if m[linha+1,coluna+1] = 1 then
	quantos_vizinhos:=quantos_vizinhos+1;
end;


function prox_geracao(var geracao: matriz; linhas,colunas: integer): matriz;
var vizinhos,i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		begin
		vizinhos:= quantos_vizinhos(geracao, i,j);		//!!!!! (v)
		if geracao[i,j] = 0 then
			begin
			if vizinhos = 3 then
				prox_geracao[i,j]:=1
			else
				prox_geracao[i,j]:=0;
			end
			
		else 
			begin
			if (vizinhos=0) or (vizinhos=1) then
				prox_geracao[i,j]:=0
			else if (vizinhos=2) or (vizinhos=3) then
					prox_geracao[i,j]:=1
				else
					prox_geracao[i,j]:=0;
			end;
		end;
end;

procedure avanca_geracao(var nova_geracao, geracao: matriz; linhas,colunas: integer);
var i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		if geracao[i,j] <> nova_geracao[i,j] then
			geracao[i,j]:= nova_geracao[i,j];
end;
			
 
begin
writeln('Qual o tamanho da area da populacao (linhas x colunas)?');
read(linhas);
read(colunas);
writeln('Digite ela, sendo 0 vazio e 1 com um individuo:');
le_matriz(geracao,linhas,colunas); //!!!! (v)
cria_borda(geracao,linhas,colunas);	//!!!! (v)
writeln();
writeln('Quantas geracoes?');
readln(geracoes);
clrscr;
imprime_matriz(geracao,linhas,colunas);
writeln();
	writeln('Digite enter para ir para a geracao 1.');
	readln(enter);
for i:=1 to geracoes do
	begin
	clrscr;
	nova_geracao:= prox_geracao(geracao, linhas,colunas);	 //!!!!! (v)
	avanca_geracao(nova_geracao, geracao, linhas, colunas);	 //!!!!! (v)
	imprime_matriz(geracao, linhas, colunas);				 //!!!!! (v)
	writeln();
	writeln('Geracao ', i,', digite enter para ir para a proxima');
	readln(enter);
	end;
end.
