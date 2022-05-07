program jgoo_Da_Velha;

uses crt;

type tabuleiro= array[1..3,1..3] of integer;

var t: tabuleiro;
	jogador_atual, linha, coluna,rodadas: integer;

procedure zera_tabuleiro(var t: tabuleiro);
var i,j: integer;
begin
for i:=1 to 3 do
	for j:=1 to 3 do
		t[i,j]:=0;
end;


procedure imprime_tabuleiro(var tab: tabuleiro);
var t: array[1..3,1..3] of char; i,j: integer;
begin
for i:=1 to 3 do
	for j:=1 to 3 do
		begin
		case tab[i,j] of
			0: t[i,j]:=' ';
			1: t[i,j]:='x';
			2: t[i,j]:='o';
			end;
		end;
writeln(t[1,1],'|',t[1,2],'|',t[1,3]);
writeln('-----');
writeln(t[2,1],'|',t[2,2],'|',t[2,3]);
writeln('-----');
writeln(t[3,1],'|',t[3,2],'|',t[3,3]);
end;

function quem_ganhou(var t: tabuleiro; rodadas: integer): integer;
var i: integer;
begin
quem_ganhou:=0;
for i:=1 to 3 do
	begin
	if (t[i,1] = 1) or (t[i,1] = 2) then
		begin
		if (t[i,1] = t[i,2]) and (t[i,2] = t[i,3]) then
			quem_ganhou:= t[i,1];
			
		if (t[1,i] = t[2,i]) and (t[2,i] = t[3,i]) then
			quem_ganhou:= t[1,i];
		end;
	end;
if (t[2,2] = 1) or (t[2,2] = 2) then
	begin
	if (t[1,1] = t[2,2]) and (t[2,2] = t[3,3]) then
		quem_ganhou:= t[2,2];
	if (t[1,3] = t[2,2]) and (t[2,2] = t[3,1]) then
		quem_ganhou:= t[2,2];
	end;
if (rodadas = 9) and (quem_ganhou = 0) then
	quem_ganhou:=3;
end;

			
		
	
		

procedure atualiza_tabuleiro(var t: tabuleiro; linha,coluna,jogador_atual: integer);
begin
t[linha,coluna]:= jogador_atual;
end;

begin
jogador_atual:=1;
zera_tabuleiro(t);						//!!!!!! (v)
rodadas:=0;
while (quem_ganhou(t,rodadas) = 0) do
	begin
	clrscr;
	imprime_tabuleiro(t);				//!!!!!! (v)
	writeln();
	writeln('Vez do jogador ',jogador_atual,' ! Digite a linha e coluna:');
	read(linha,coluna);
	atualiza_tabuleiro(t, linha,coluna, jogador_atual);		//!!!! (v)
	rodadas:= rodadas+1;
	if jogador_atual = 1 then
		jogador_atual:=2
	else
		jogador_atual:=1;
	end;
clrscr;
imprime_tabuleiro(t);
writeln();
if quem_ganhou(t,rodadas) = 1 then								//!!!!! (v)
	writeln('Parabens Jogador 1, voce venceu !');
if quem_ganhou(t,rodadas) = 2 then
	writeln('Parabens Jogador 2, voce venceu !');
if quem_ganhou(t,rodadas) = 3 then
	writeln('Ninguem ganhou, deu velha! :P');
end.
	
