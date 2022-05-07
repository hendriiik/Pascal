program menor_leemnto;

type matriz= array[1..100,1..100] of integer;
var linhas,colunas,menor: integer; m: matriz;

function le_matriz(linhas, colunas: integer): matriz;
var i,j: integer;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		read(le_matriz[i,j]);
end;


function menor_elemento_matriz(var m: matriz; linhas,colunas: integer): integer;
var menor,i,j: integer;
begin
menor:=m[1,1];
for i:=1 to linhas do
	for j:=1 to colunas do
		if m[i,j]< menor then
			menor:= m[i,j];
menor_elemento_matriz:= menor;
end;



begin
writeln('Insira linhas e colunas da matriz:');
read(linhas);
read(colunas);
writeln('Insira a matriz:');
m:= le_matriz(linhas,colunas);
writeln();
writeln('O menor elemento da matriz eh:');
menor:= menor_elemento_matriz(m, linhas, colunas);
writeln(menor);
end.
