program clareia_pgm;

type matriz=array[1..600,1..600] of integer;
var m: matriz; cabecalho: string; colunas,linhas,branco: longint; clareia: integer;

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

procedure clareia_imagem(var m: matriz; linhas,colunas: longint; clareia: integer; branco: longint);
var i,j: longint;
begin
for i:=1 to linhas do
	for j:=1 to colunas do
		begin
		if m[i,j]+clareia >= branco then
			m[i,j]:= branco
		else 
			m[i,j]:= m[i,j]+ clareia;
		end;
end;
 


begin
read(cabecalho);
if cabecalho <> 'P2' then
	writeln('formato invalido');
read(colunas);
read(linhas);
read(branco);
m:= le_matriz(linhas,colunas);
writeln(' quanto deseja clarear? ');
read(clareia);
clareia_imagem(m,linhas,colunas,clareia,branco);
writeln();
writeln('P2');
writeln(colunas,' ',linhas);
writeln(branco);
imprime_matriz(m,linhas, colunas);
end.
