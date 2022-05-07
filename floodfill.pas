program inundacao;

uses crt;

type coordenada= array[1..2] of integer;

type jogo= record
		matriz: array[0..51,0..51] of integer;
		linhas: integer;
		colunas: integer;
		cores: integer;
		jogadas: integer;
		end;
		
type pilha= record
	ini : longint ;
	v: array [ 1..1000] of coordenada ;
	end;
		
var cores, linhas,colunas, cor: integer;
	m: jogo;

procedure inicializar_pilha(var p:pilha);
begin
p.ini:=0;
end;

function pilha_vazia(p: pilha): boolean;
begin
pilha_vazia:= p.ini = 0;
end;

procedure empilhar(x: coordenada; var p:pilha);
begin
p.ini:= p.ini+1;
p.v[p.ini]:=x;
end;

function desempilhar( var p: pilha): coordenada;
begin
desempilhar:= p.v[p.ini];
p.ini:= p.ini-1;
end;

function topo(p:pilha): coordenada;
begin
topo:= p.v[p.ini];
end;

function so_uma_cor(j: jogo): boolean;
var cor,i,k: integer; eh: boolean;
begin
cor:=j.matriz[1,1];
eh:=true;
i:=1;
k:=1;
while (i<= j.linhas) and (eh= true) do
	begin
	while (k<= j.colunas) and (eh = true) do
		begin
		if j.matriz[i,k] <> cor then
			eh:= false;
		k:=k+1;
		end;
	k:=1;
	i:=i+1;
	end;
so_uma_cor:= eh;
end;



function cria_tabuleiro(cores: integer; l: integer; c :integer): jogo;
var cor,i,j: integer; m: array[0..51,0..51] of integer;
begin
randomize;
with cria_tabuleiro do
	begin
	linhas:= l;
	colunas:= c;
	cores:= cores;
	jogadas:=0;
	end;
for i:= 1 to l do
	for j:=1 to c do
		begin
		cor:=random(cores)+1;
		m[i,j]:= cor;
		end;
		
for i:= 1 to l do
	begin
	m[i,0]:=-9;
	m[i,c+1]:=-9;
	end;
	
for i:=1 to c do
	begin
	m[0,i]:=-9;
	m[l+1,i]:=-9;
	end;
cria_tabuleiro.matriz:=m;
end;

procedure imprime_tabuleiro(var m: jogo);
var i,j: integer;
begin
for i:=1 to m.linhas do
	begin
	for j:=1 to m.colunas
		do write(m.matriz[i,j],' ');
	writeln();
	end;
end;

procedure atualiza_cores( var m: jogo; cor: integer);
var cor_antiga,i,j: integer; aux,coord: coordenada; p: pilha;  
begin
cor_antiga:= m.matriz[1,1];
inicializar_pilha(p);
coord[1]:=1;
coord[2]:=1;
empilhar(coord,p);
m.matriz[1,1]:=cor;
while pilha_vazia(p) = false do
	begin
	coord:=desempilhar(p);
	i:= coord[1];
	j:= coord[2];
	if m.matriz[i-1,j] = cor_antiga then
		begin
		aux[1]:= i-1;
		aux[2]:= j;
		empilhar(aux,p);
		m.matriz[i-1,j]:= cor;
		end;
	
	if m.matriz[i+1,j] = cor_antiga then
		begin
		aux[1]:= i+1;
		aux[2]:= j;
		empilhar(aux,p);
		m.matriz[i+1,j]:= cor;
		end;
	
	if m.matriz[i,j-1] = cor_antiga then
		begin
		aux[1]:= i;
		aux[2]:= j-1;
		empilhar(aux,p);
		m.matriz[i,j-1]:= cor;
		end;
	
	if m.matriz[i,j+1] = cor_antiga then
		begin
		aux[1]:= i;
		aux[2]:= j+1;
		empilhar(aux,p);
		m.matriz[i,j+1]:= cor;
		end;
	end;
end;


begin
writeln('Quantas cores?');
read(cores);
clrscr;
writeln('Quantas linhas e colunas?');
read(linhas);
read(colunas);
m:= cria_tabuleiro(cores, linhas,colunas);
while so_uma_cor(m) = false do
	begin
	clrscr;
	imprime_tabuleiro(m);
	writeln();
	writeln('De que cor gostaria de pintar o primeiro numero?');
	read(cor);
	atualiza_cores(m,cor);
	m.jogadas:= m.jogadas+1;
	end;
clrscr;
imprime_tabuleiro(m);
writeln();
writeln('Voce ganhou em ', m.jogadas, ' jogadas!');
end.
	
	
	
