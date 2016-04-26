-- 送信任务.lua (送信任务主文件)
-- By: Dan_Deng(2003-12-08)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua")


Define_City = {"<#>临安","<#>凤翔","<#>成都","<#>大理","<#>汴京","<#>襄阳","<#>扬州"}

function default_talk(letter_laststation)

local nParTaskState = GetMasterTaskState(PARID_TASK_MASTER_002);
local aryTalk = {"<dec><npc>江湖上的事情我不管，目前时局纷乱，朝廷自己也有许多麻烦要解决啊。"};

	if nParTaskState==nil then nParTaskState = 0; end;
	
	--tinsert(aryTalk, );
	
--T筸 ng t輓h n╪g t輓 s? - Modified by DinhHQ - 20110427
	tinsert(aryTalk, "我想为朝廷出些力/especiallymessenger");
	tinsert(aryTalk, "我只是来随便转转/no");
	
	CreateTaskSay(aryTalk);

end

function lastdefault_talk(letter_station)
	Uworld12 = GetTask(12)
	if (Uworld12 == 0) then				-- 随时可以开始任务（以前未做过）
		W12_get(letter_station)
	elseif (Uworld12 < 256) then		-- 任务中
		check_letter(letter_station)
	elseif (GetGameTime() >= Uworld12) then		-- 已超过重复时间限制，允许再次进行任务（暂时使用在线时间）
		W12_get(letter_station)
	else													-- 等待重复进行任务中
		Talk(1,"","驿官：现在暂时没有信件需要你帮忙的，过一段时间再来看看吧。")
	end
end

function W12_get(start_city)
	dest_city = random(1,7)				-- 现在是7个城市
	if (dest_city == start_city) then		-- 不允许送信的源城市与目标城市重复
		Talk(1,"","驿官：现在暂时没有信件需要你帮忙的，过一段时间再来看看吧。")
	else
		SetTaskTemp(3,start_city*10+dest_city)		-- 十位数为起始地，个位数为目标地
		Say("驿官：如今战事频频，公文繁多，驿站里送信的人手不够，你愿意帮忙送信吗？每次送信都是有酬银的。",2,"愿意/W12_get_yes","不愿意/no")
	end
end

function check_letter(get_city)
	x = GetTask(12)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- 应该肯定能整除
	if (dest_city == get_city) then			-- 目标城市
		if (HaveItem(231+x) == 1) then			-- 有信函能对应上，任务完成
			Talk(1,"","<#>驿官：收到"..Define_City[start_city].."<#>发来信函一封，验证无误。这是你的谢礼500两。")
			DelItem(231+x)
			SetTask(12,GetGameTime()+7200)				-- 两小时（7200秒）后可重复做任务
			i = random(1,10)		-- 随机给声望奖励
			AddRepute(i)
			Msg2Player("<#>成功将信函送到目的驿站，任务完成。你的声望上升了"..i.."<#>点。")
			AddNote("成功将信函送到目的驿站，任务完成。")
			Earn(500)
		else												-- 信函丢失，取消任务
			Say("驿官：你把那么重要的公函弄丢了？这下可麻烦了。要么，交2000两银子我帮你把这事遮掩过去吧。",2,"交钱/W12_cancel","我再找找/no")
		end
	elseif (start_city == get_city) then	-- 起始城市
		if (HaveItem(231+x) == 0) then			-- 信函丢失，取消任务
			Say("驿官：你把那么重要的公函弄丢了？这下可麻烦了。要么，交2000两银子我帮你把这事遮掩过去吧。",2,"交钱/W12_cancel","我再找找/no")
		else
			Talk(1,"","驿官：这是紧急公文，麻烦你快一点送去。")
		end
	else 																					-- 其它情况（任务未完成）
		Talk(1,"","<#>驿官：你这封信函不是送到这里的，你应该送到"..Define_City[dest_city].."<#>去。")
	end
end

function W12_cancel()
	if (GetCash() >= 2000) then
		Pay(2000)
		SetTask(12,0)
		Msg2Player("你的送信任务被取消了。")
		AddNote("你的送信任务被取消了。")
		Talk(1,"","驿官：这次就这样算了，以后你可要小心了啊！")
	else
		Talk(1,"","驿官：连2000两都没有？你怎么这么穷啊。有了钱再来找我吧！")
	end
end

function W12_get_yes()
	x = GetTaskTemp(3)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- 应该肯定能整除
	Talk(1,"","<#>驿官：请帮我把这封信函送到"..Define_City[dest_city].."<#>，拜托了。")
	Msg2Player(Define_City[start_city].."<#>驿官请你帮他将一封函件送到"..Define_City[dest_city].."<#>去。")
	AddNote("<#>接到送信任务：请将一封函件从"..Define_City[start_city].."<#>送到"..Define_City[dest_city].."。")
	SetTask(12,x)
	AddEventItem(231+x)		-- 信函从242开始，城市从1开始
end

function no()
end
