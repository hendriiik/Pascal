program vet6;
type vetor= array[1..200] of real;
var vet: vetor; codigo, tam,i: integer;

procedure remove(var vet: vetor; i: integer;var tam: integer);
var aux: real; j: integer;
begin
for j:= tam downto i+1 do begin
	aux:=vet[j-1];
	vet[j-1]:= j;
	end;
tam:= tam-1
end;

procedure insere(var vet: vetor; i: real;elemento: real; var tam: integer);
var j: integer;
begin
for j:= tam downto i do
	vet[j+1]:= vet[j];
	
vet[i]:= elemento;
end;
	

procedure cod1(var vet: vetor; var tam: integer);
var elemento, aux: real; aux2, aux3: integer;
begin
read(elemento);
if tam = 0 then
	vet[1]:= elemento
else if tam = 1 then
	begin
	if vet[1] > tam then
		begin
		aux:= vet[1];
		vet[1]:= elemento;
		vet[2]:= aux;
		end
	else begin
		if elemento < vet[1] then
			insere( vet, 1, elemento, tam)
		
		else begin
			aux2:= 1;
			for aux3:= 2 to tam do
				begin
				if vet[aux2] < elemento and vet[aux3] > elemento then
					insere(vet,aux3, elemento,tam);
				aux2:= aux2 + 1;
				end;
				
			if elemento> vet[tam] then
				vet[tam+1]:= elemento;
			end;
		end;
		tam:= tam+1;
end;
 
procedure cod2(var vet: vetor; var tam: integer);
var i: integer; remov: boolean; elemento: real;
begin;
remov:= false;
read(elemento);
for i:=1 to tam do 
	begin
	if vet[i] = elemento then
		begin
		remove (vet, i, tam);
		remov:= true;
		end;
	if remov= false then
		writeln('erro')
	else tam:= tam -1;
end;




begin
tamanho:= 0;
read(codigo);

while codigo <> 0 do
	begin
	if codigo = 1 then
		cod1(vet,tam)
	
	else if codigo = 2 then
		cod2(vet, tam);
	
	read(codigo);
	end;
for i:= 1 to tam do
	write(vet[i],' ');
end.
