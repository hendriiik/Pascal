program ddd_final;

type cliente= record
	nome: string[50];
	ddd: byte;
	fone: string[9];
	dia: byte;
	mes: byte;
	ano: integer;
	end;
	
type vetor= array[1..100] of cliente;

var lista: vetor;
	i,quantidade,indice_mais_jovem: integer;
	
procedure le_campos(var atual: cliente);
begin
with atual do
	begin
	writeln();
	write('Insira o nome: ');
	readln(nome);
	write('Insira o ddd: ');
	readln(ddd);
	write('Insira o telefone: ');
	readln(fone);
	write('Insira o dia do nascimento: ');
	readln(dia);
	write('Insira o mes do nascimento: ');
	readln(mes);
	write('Insira o ano do nascimento: ');
	readln(ano);
	end;
end;

procedure imprime_cliente(var atual: cliente);
begin
with atual do
	begin
	writeln(nome);
	writeln(ddd);
	writeln(fone);
	writeln(dia);
	writeln(mes);
	writeln(ano);
	end;
end;

function cliente_mais_jovem(var lista: vetor; tamanho: integer): integer;
var menor_ano,menor_mes,menor_dia: integer;
begin
menor_ano:= lista[1].ano;
menor_mes:= lista[1].mes;
menor_dia:= lista[1].dia;
cliente_mais_jovem:=1;
for i:=2 to tamanho do
	begin
	if menor_ano < lista[i].ano then
		begin
		menor_ano:= lista[i].ano;
		menor_mes:= lista[i].mes;
		menor_dia:= lista[i].dia;
		cliente_mais_jovem:=i;
		end
	else if  menor_ano= lista[i].ano then
			begin
			if menor_mes < lista[i].mes then
				begin
				menor_mes:= lista[i].mes;
				menor_dia:= lista[i].dia;
				cliente_mais_jovem:=i;
				end
			else if menor_mes = lista[i].mes then
					begin
					if menor_dia < lista[i].dia then
						begin
						menor_dia:=lista[i].dia;
						cliente_mais_jovem:=i;
						end;
					end;
			end;
	end;
end;


	
	
begin
writeln('quantos clientes?');
readln(quantidade);
for i:=1 to quantidade do
	le_campos(lista[i]);
indice_mais_jovem:= cliente_mais_jovem(lista, quantidade);
writeln();
writeln('O cliente mais jovem eh:');
imprime_cliente(lista[indice_mais_jovem]);
end.
