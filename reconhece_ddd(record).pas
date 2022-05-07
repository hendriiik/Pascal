program ddd_de_curitiba;

type 
dados= record
	nome: string[50];
	ddd: integer;
	telefone: string[11];
	end;
	
vetor= array[1..100] of dados;

var r: dados;
	lista: vetor;
    tamanho,i: integer;

procedure le_cliente(var r: dados);
begin
with r do
begin
readln(nome);
readln(ddd);
readln(telefone);
end;
end;

procedure imprime_cliente(var r: dados);
begin
with r do
begin
writeln(nome);
writeln(ddd,' ',telefone);
end;
end;


begin
writeln('quantos clientes vai ler?');
readln(tamanho);
for i:= 1 to tamanho do
	begin
	lista[i]:=r;
	le_cliente(lista[i]);
	end;

for i:=1 to tamanho do
	begin
	if (lista[i].ddd = 41) or (lista[i].ddd = 21) then
		imprime_cliente(lista[i]);
	end;
end.
	
	
		
