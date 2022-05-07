program avestruz;

const MAX = 100;

type vetor = array [1..MAX] of longint;

var
    v : vetor;
    n, pos, tamanho_subsequencia: longint;

procedure le_vetor (var vet: vetor; n: longint);
var i,elemento: longint;
begin
for i:=1 to n do
	begin
	read(elemento);
	vet[i]:= elemento;
	end;
end;



function compara_segmentos(var vet: vetor; comeco_prim, comeco_seg, tamanho: integer): integer;
var nao_eh: boolean; i: integer;
begin
nao_eh:= false;
for i:=1 to tamanho-1 do
	begin
	if vet[comeco_prim+i] <> vet[comeco_seg+i] then
		nao_eh:= true;
	end;
if nao_eh= false then compara_segmentos:= comeco_prim
else compara_segmentos:= 0;
end;

function tem_subsequencia_iguais (var vet: vetor; tamanho_vet, tam_segmento: longint): longint;
var cont_prim, cont_seg, ja_foi: integer;
begin
cont_prim:=1;
ja_foi:=0;
while (cont_prim <= tamanho_vet - 2*tam_segmento + 1) and (ja_foi=0) do
	begin
	for cont_Seg:= cont_prim+ tam_segmento-1 to cont_prim+2*tam_segmento-1 do
		begin
		if vet[cont_prim] = vet[cont_seg] then
			ja_foi:= compara_segmentos(vet, cont_prim, cont_seg, tam_segmento)
		end;
cont_prim:= cont_prim+1;
	end;
tem_subsequencia_iguais:= ja_foi;
end;
			
(*
recebe uma subsequencia "vet" que em tamanho "tamanho_Vet" e procura por subsequencias
iguais de tamanho "tam_segmento". A funcao devolve zero se nao encontrou
subsequencias iguais ou devolve a posicao do inicio da primeira subsequencia
que encontrou.
*)

(* programa principal *)
begin
    read (n);
    // tamanho da subsequencia a ser lido
    le_vetor (v,n); 
    pos:= 0;
    tamanho_subsequencia:= n div 2; // inicia com maior valor possivel
    while (pos = 0) and (tamanho_subsequencia >= 2) do
    begin
         pos:= tem_subsequencia_iguais (v,n,tamanho_subsequencia);
         tamanho_subsequencia:= tamanho_subsequencia - 1;
    end;
    if pos > 0 then
        writeln ('existe ',pos,' subsequencias de tamanho ',tamanho_subsequencia+1)
    else
        writeln ('nenhuma');
end.
