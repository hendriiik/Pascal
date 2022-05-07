program contrario;
var n,m: longint;

var mode,inve:longint;

function contrario (e1,e2:longint):boolean;
begin
contrario := true;

	while (e1 <> 0) do
	begin
		mode := e1 mod 10;
		inve := (inve + mode) * 10;
		e1	 := e1 div 10;
		if (e1 < 10) then
			begin
				inve := inve + e1;
				e1	 := 0;
			end;
		contrario:=true;
	end;

	if (inve <> e2) then
			contrario := false;
		

end;

begin
read (n,m);
if contrario (n,m) then
writeln (n,' eh o contrario de ',m)
else
writeln (n,' nao eh o contrario de ',m);
end.
