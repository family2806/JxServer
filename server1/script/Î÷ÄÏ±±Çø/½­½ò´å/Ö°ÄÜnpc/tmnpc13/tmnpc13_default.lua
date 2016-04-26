--description: 唐门江津村唐元 非任务对话
--author: yuanlan	
--date: 2003/3/12


function tmnpc13_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 56) then  
	Say("三师兄可能去了<color=Red>响水洞<color>, 听说他在那里有些朋友.", 0)
else
	Say("我父母早逝，是舅舅把我养大的，他是我最亲的人.", 0)
end

end;


