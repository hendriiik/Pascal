program mat_inversa;

type matriz= array[1..100,1..100] of real;
var linhas_a,colunas_a,linhas_b,colunas_b: integer; a,b,m: matriz; eh_identidade: boolean; elemento: longint;


function le_matriz(linhas,colunas: integer): matriz;
var i,j: integer;
begin
for i:= 1 to linhas do
	for j:=1 to colunas do
	begin
		read(elemento);
		le_matriz[i,j]:= elemento;
	end;
end;

function multiplica_matrizes(var a: matriz; linhas_a,colunas_a: integer;var b: matriz;linhas_b,colunas_b: integer): matriz;
var i,j,k: integer; m: matriz;
begin
for i:=1 to linhas_a do
	for j:=1 to colunas_b do
		begin
		m[i,j]:=0;
		for k:=1 to colunas_a do
			m[i,j]:= m[i,j]+ a[i,k]*b[k,j];
		end;
multiplica_matrizes:=m;
end;



function checa_matriz_identidade(var m: matriz; linhas,colunas: integer): boolean;
var i,j: integer;
begin
checa_matriz_identidade:= true;
if linhas <> colunas then
	checa_matriz_identidade:= false
else
	begin
	for i:=1 to linhas do
		for j:=1 to colunas do
			begin
			if i=j then
				begin
				if m[i,j] <> 1 then
					checa_matriz_identidade:= false
				end
			else
				begin
				if m[i,j] <> 0 then
					checa_matriz_identidade:= false;
				end;
			end;
	end;
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
writeln('Vamos checar se a matriz B eh a inversa de A!');
writeln('Insira a quantidade de linhas e colunas da matriz A:');
read(linhas_a);
read(colunas_a);
writeln('Insira a matriz A (de inteiros):');
a:= le_matriz(linhas_a,colunas_a);
writeln('Insira a quantidade de linhas e colunas da matriz B:');
read(linhas_b);
read(colunas_b);
writeln('Insira a matriz B: (de inteiros)');
b:= le_matriz(linhas_b,colunas_b);
m:= multiplica_matrizes(a,linhas_a,colunas_a,b,linhas_b,colunas_b);
eh_identidade:= checa_matriz_identidade(m,linhas_a,colunas_b);
if eh_identidade = true then
	writeln('sim, B eh a inversa de A')
else
	writeln('nao, B nao eh a inversa de A');
end.
