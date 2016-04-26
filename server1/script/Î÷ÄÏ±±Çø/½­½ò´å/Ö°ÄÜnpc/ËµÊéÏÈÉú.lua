--西南北区 江津村 说书先生罗晓音

function main(sel)

Say("流落江湖大半生，最后只是一个贫穷的人!", 2, "听一段书/yes", "不听 /no");

end;


function yes()
	i=random(0,2);
	if(i == 0)then
		PlayMusic("\\Music\\Music901.mp3")
	elseif(i == 1)then
		PlayMusic("\\Music\\Music902.mp3")
	else
		PlayMusic("\\Music\\Music903.mp3")
	end;
end;


function no()
end;
