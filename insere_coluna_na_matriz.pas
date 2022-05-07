program iserir_coluna;

type matriz= array[1..100,1..100] of integer;
type vetor= array[1..100] of integer;

var linhas,i, colunas,posicao: integer; vet: vetor; mat:matriz;

function le_matriz(linhas, colunas: integer): matriz;
var i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		read(le_matriz[i,j]);
end;

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

procedure insere_coluna_na_matriz(var v: vetor; posicao: integer; var m: matriz; linhas: integer; var colunas: integer);
var  i,j: integer;
begin
for i:=1 to linhas do
	begin
	for j:=colunas downto posicao do
		m[i,j+1]:=m[i,j];
	m[i,posicao]:= v[i];
	end;
colunas:= colunas+1;
end;

begin
writeln('digite linhas e colunas:');
read(linhas);
read(colunas);
writeln('digite a matriz:');
mat:= le_matriz(linhas,colunas);
vet[1]:=0;
writeln('digite o vetor a ser inserido: ');
for i:=1 to linhas do
	read(vet[i]);
writeln('em qual coluna inserir?');
read(posicao);
insere_coluna_na_matriz(vet,posicao, mat, linhas,colunas);
imprime_matriz(mat, linhas,colunas);
end.
	
