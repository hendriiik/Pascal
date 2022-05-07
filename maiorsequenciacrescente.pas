program maiorsequenciacrescente;

var atual,anterior,seq,maior_seq: longint;

begin
writeln('escreve uma sequencia e qnd terminar digite 0:');
seq:=1;
maior_seq:=1;
read(atual);

while (atual<>0) do begin
anterior:=atual;
read(atual);
if (atual>=anterior) then seq:=seq+1
else seq:=1;

if (seq > maior_seq) then maior_seq:= seq;

end;
write('a maior sequencia crescente tem tamanho: ',maior_seq);
end.
