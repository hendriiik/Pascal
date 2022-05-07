program grau_min_seg;

var grau,min,seg : integer;

begin;
writeln('Digite os segundos:');
read(seg);
min := 0;
grau := 0;

if (seg >= 60) then
	min := seg div 60;
	seg := seg mod 60;
	
if (min >= 60) then
	grau := min div 60;
	min := min mod 60;
	
write(grau, ' graus ', min, ' minutos ', seg,' segundos');

end.
