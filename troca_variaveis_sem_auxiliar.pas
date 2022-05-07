program troca_var_sem_auxiliar;

var a,b: integer;

begin;
writeln('Digite as variaveis:');
read(a,b);

a := b + a;
b := a - b;
a := a - b;

write(a,' ',b);

end.
