program ordenar_por_nomes;

type vetor= array[1..100] of string;

var tamanho,i,j: integer;
	str,aux: string;
	vet: vetor;
	

begin
writeln('Digite quanto snomes serao lidos:');
readln(tamanho);
for i:=1 to tamanho do
	begin
	write('Digite o nome: ');
	readln(str);
	vet[i]:= str;
	end;
writeln();
writeln('Lista de nomes em ordem alfabetica:');
for i:=1 to tamanho-1 do
	begin
	for j:=i+1 to tamanho do
		begin
		if vet[j] < vet[i] then
			begin
			aux:= vet[j];
			vet[j]:= vet[i];
			vet[i]:= aux;
			end;
		end;
	end;
for i:=1 to tamanho do
	writeln(vet[i]);
end.
