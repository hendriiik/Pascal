program i;

var num1,num2,VouF: longint;

begin;
num1:=0;
num2:=1;
VouF:=1;
while (num1 = 0) do begin

read(num1);
if (num1<>0) then begin
read(num2);
if (num1*num1<>num2) then VouF:=0;
end;
end;
if(VouF = 1) then
	writeln('B eh o quadrado de A')
else 
	writeln('B nao eh o quadrado de A');

end.
