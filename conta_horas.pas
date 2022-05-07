program soma_horas;

var hora1, min1, hora2, min2, somah, somamin : integer;

begin;

writeln('Somador de Horas! Digite o primeiro horario na forma 00 00:');
read(hora1);
read(min1);
writeln('Digite o segundo horario na forma 00 00:');
read(hora2);
read(min2);
somah := hora1+hora2;
somamin := min1+min2;

if (somamin>=60) then
begin;
	somah := somah + 1;
	somamin := somamin - 60;
end;
	
if (somah >= 24) then
	somah := somah-24;


write(' ', hora1, ':', min1, ' + ', hora2, ':',min2, ' = ' ,somah, ':', somamin);

end.
