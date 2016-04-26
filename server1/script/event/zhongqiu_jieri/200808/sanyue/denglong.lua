--zhongchaolong

--存在5分钟的灯笼


function main()	--对话入口
	
	local tbSay = 
	{
		"这个灯笼太漂亮了",
		"这个闪闪的灯笼太漂亮了",
		"中秋赏灯笼真是快乐.",
		"中秋真是浪漫，让我很想你"
	}
	
	Say(tbSay[random(1,getn(tbSay))], 0)
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;