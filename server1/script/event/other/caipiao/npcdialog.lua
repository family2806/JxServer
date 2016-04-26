Include("\\script\\event\\other\\caipiao\\head_gs.lua")
Include("\\script\\event\\poster\\head.lua")

function main()
	

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nDate >= 201006190000 and nDate <= 201007310000) then
		local tbOpt = {}
		local szTitle = "<#>".."请问大侠要什么";
		tinsert(tbOpt, "我要领奖 Poster/GetDialogPoster")
		tinsert(tbOpt, "离开/OnCancel")
		Say(szTitle, getn(tbOpt), tbOpt)
	end

	
	if 201002040000 > nDate or nDate > 201003220000 then
		--return Talk(1, "", "活动结束了.")	
	else
	
		local szTitle = "<npc>".."发财了！真幸运，看来各位和这个游戏很有缘呢!";
		
		
		
		local nWeekDay = tbCaiPiao:GetCurAwardWeekDay()
		
		local szKey = ""
		local szKey2 = ""
		if not nWeekDay or nWeekDay <=0 then
			
			szKey = nil
		elseif mod(nWeekDay, 10) == 0 then
			szKey = "每周奖励"
			szKey2 = szKey
		else
			szKey = "这层"
			szKey2 = "这层奖励"
		end
		
		
		
		local tbOpt = {}
		if szKey then
			local szOpt1 = format("看中奖号码 %s", szKey)
			local szOpt2 = format("得到 %s", szKey2)	
			tinsert(tbOpt, {szOpt1, tbCaiPiao.QueryResult,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {szOpt2, tbCaiPiao.ApplyGetAward,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {"我只是路过"})
		else
			tinsert(tbOpt, {"现在还没有结果，有结果之后再来吧！"})
		end
			
		
		CreateNewSayEx(szTitle, tbOpt)
	end
end

