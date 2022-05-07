program testa_se_primo;
uses math;
var i: longint;

function eh_primo(primo: longint): boolean;
var divisores,cont,max: longint;

begin
divisores:=0;
max:=round(sqrt(primo))+1;

for cont:=1 to max do
	begin
	if primo mod cont = 0 then 
		if cont <> primo then
			divisores:= divisores+1;
	end;
	
if divisores <= 1 then
	eh_primo:= true
	
else
	eh_primo:=false
	
end;
		
begin
    for i:= 1 to 10000 do
        if eh_primo (i) then
            writeln (i);
end.
