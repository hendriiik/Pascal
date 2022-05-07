program inversao;

type vetor=array[1..200] of integer;
var n: integer; vet: vetor;

function le_vetor_tamanho(tamanho: integer): vetor;
var i: integer; elemento:longint;
begin
for i:= 1 to tamanho do
	begin
	read(elemento);
	le_vetor_tamanho[i]:=elemento;
	end;
end;

procedure imprime_vetor(var vet: vetor; tamanho: integer);
	var i: integer;
	begin
	for i:= 1 to tamanho do
		write(vet[i],' ');
	end;

procedure inverte_vetor(var v: vetor; tamanho: integer);
var i,meio: integer; aux: longint;
begin
meio:= tamanho div 2;
for i:= 1 to meio do
	begin
	aux:= v[i];
	v[i]:= v[tamanho-i+1];
	v[tamanho-i+1]:= aux;
	end;
end;

begin
read(n);
vet:= le_vetor_tamanho(n);
inverte_vetor(vet,n);
writeln();
imprime_Vetor(vet,n);
end.
