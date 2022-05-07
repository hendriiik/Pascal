program sawaranenai;

type matriz= array[1..100,1..100] of integer;
var m1,m2,mfinal: matriz; linhas1,linhas2,colunas1,colunas2: integer;


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

function multiplica_matrizes(var m1, m2: matriz; linhas1,colunas1,linhas2,colunas2: integer): matriz;
var i,j,k: integer;
begin
for i:= 1 to linhas1 do 
	for j:=1 to colunas2 do
		begin
		multiplica_matrizes[i,j]:=0;
		for k:=1 to colunas1 do
			multiplica_matrizes[i,j]:= multiplica_matrizes[i,j]+ m1[i,k]*m2[k,j];
		end;
end;






begin
writeln('insira as linhas e colunas da matriz 1:');
read(linhas1);
read(colunas1);
writeln();
writeln('insira as linhas e colunas da matriz 2:');
read(linhas2);
read(colunas2);
writeln();
writeln('insira a matriz1:');
writeln(); 
m1:=le_matriz(linhas1,colunas1);
writeln('insira a matriz2:'); 
m2:=le_matriz(linhas2,colunas2);
writeln();
writeln('a matriz final eh:');
mfinal:= multiplica_matrizes(m1,m2,linhas1,colunas1,linhas2,colunas2);
imprime_matriz(mfinal,linhas1,colunas2);
end.
