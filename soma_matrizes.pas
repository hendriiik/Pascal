program spoma_matrizes;

type matriz= array[1..100,1..100] of integer;
var m1,m2,mfinal: matriz; linhas,colunas: integer;

function le_matriz(linhas, colunas: integer): matriz;
var i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		read(le_matriz[i,j]);
end;

function soma_matrizes(var m1,m2: matriz; linhas,colunas: integer): matriz;
var i,j: integer; mfinal: matriz;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		mfinal[i,j] := m1[i,j]+ m2[i,j];
soma_matrizes:= mfinal;
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



begin
writeln('insira as linhas e colunas:');
read(linhas);
read(colunas);

writeln('digite a matriz 1:');
m1:= le_matriz(linhas,colunas);
writeln();

writeln('digite a matriz 2:');
m2:= le_matriz(linhas,colunas);
writeln();

writeln('a soma das duas matrizes eh:');
writeln();
mfinal:= soma_matrizes(m1,m2,linhas,colunas);
imprime_matriz(mfinal,linhas,colunas);
end.
