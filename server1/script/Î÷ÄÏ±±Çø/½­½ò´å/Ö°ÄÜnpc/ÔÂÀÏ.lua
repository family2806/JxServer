-- 月老.lua 结婚申请人NPC，NPC所在地待定
-- By: Dan_Deng(2003-12-27)
-- Uworld67 == GetTask(67)　各字位意义：1-7(结婚任务各状态)，8-15(结婚次数)，16-23(待定)，24(婚否)，25-32(待定)
-- PS：2（是否送过戒指）
-- GetTaskTemp(5)：记录是否已提亲（或被提亲）
-- GetTaskTemp(6)：记录提亲者的在线ID
-- GetTaskTemp(7)：记录被提亲者的在线ID
-- 结婚条件：未婚, 等级>=20, 男方做队长, 男方去找月老说话, 然后女方再去说话，接受求亲
-- By: Dan_Deng(2004-03-02) 重写脚本结构，以便维护
-- Update: Dan_deng(2004-03-02) 协议离婚
-- Update: Fanghao_Wu(2004-8-20) 七夕送礼
-- Update: 子非鱼 (2007-10-12) 修改修复婚状态

Include("\\script\\global\\teamhead.lua");
Include("\\script\\event\\valentine2007\\event.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

TK_DATE_APPLYDIV = 1779; --单方离婚任务号
TOTALSEC_OF_DAY = 60 * 60 * 24; -- 1天等于多少秒，用于把天数转成秒
COSTOFSIMGLEDIV = 1000000; --单方离婚花费

function main(sel)
	if (check_married() == 1) then
		SetTask(67, SetBit(GetTask(67), 24, 0));
		Msg2Player("<color=yellow>你的婚配状态已改变<color>");
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	if (GetSex() == 0) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>你的意中人还没回答你，需要她快点吗?"
		tbDailog:AddOptEntry("我想，我的求婚太唐突了，你可以帮我取消吗?", male_cancel)
		tbDailog:AddOptEntry("好，我去试试看", male_hurry)
	elseif (GetSex() == 1) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>他等你的回复呢，想好了和他过一辈子吗?"
		tbDailog:AddOptEntry("是，我愿一生陪他走完此生.", female_yes)
		tbDailog:AddOptEntry("不，我不想在这时决定自己的人生.", female_cancel)
	else
		tbDailog.szTitleMsg = "<#><npc>月老很忙，到那时可以看和解决年轻人的婚姻."
		tbDailog:AddOptEntry("我已有意中人了，想向她求婚", Qmarry)
		tbDailog:AddOptEntry("我们的性格不合，想离婚了.", divorce)
		tbDailog:AddOptEntry("我们夫妻整天吵架，请月老给我点忠告.", fix_marry)
		tbDailog:AddOptEntry("申请单方面离婚", singlediv_apply)
		tbDailog:AddOptEntry("单方面离婚手续.", sure_process_dinglediv)
		tbDailog:AddOptEntry("没事，我只是路过而已.", no)
	end
	
	tbDailog:Show()
end
-----------单方面离婚----------------
--申请单方面离婚
function singlediv_apply()
	if (check_marrystate() == 0) then
		return
	end;
	
	local nDays = get_passdays();
	local str = "申请离婚时间不够 <color=yellow>1 天<color>, ";
	if (nDays > 0) then
		str = format("你申请离婚已经<color=yellow>%d 天<color> 了, ",nDays);
	end;
	if (GetTask(TK_DATE_APPLYDIV) ~= 0) then
		Say(format("月老: %s 不要申请离婚了.", str), 0);
		return
	end;
	
	Say(format("百年修得同船渡，千年修得共枕眠。单方面离婚需要交 <color=yellow>%d 两<color>. 你真的想断绝这段姻缘吗?",COSTOFSIMGLEDIV), 2,
		"申请单方面离婚/makesure_apply",
		"让我想想/no");
end;

--确认申请：单方面离婚
function makesure_apply()
	local nDate = GetCurServerTime();
	SetTask(TK_DATE_APPLYDIV, nDate);
	
	WriteLog(format("%s\tAccount:%s[Name:%s] 已申请单方面离婚.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));	
	Say("月老: 虽然你已决定，只怕以后会后悔，我给你一点时间考虑，一周后来见我.", 0);
	informother(Say, format("配偶 %s 见月老申请单方面离婚，1周后将自动<color=yellow>断绝配偶关系<color>.",GetName()), 0);
end;

--通知配偶
function informother(proc, ...)
	local Lover = GetMateName();
	if (Lover == "") then 
		return 1
	end;
	
	local nOldPlayer = PlayerIndex
	local nIdx = SearchPlayer(Lover);
	if (nIdx <= 0) then
		return 1;
	end;
	
	if (not proc or type(proc) ~= "function") then
		return 1;
	end;
	PlayerIndex = nIdx;
	call(proc, arg);
	
	PlayerIndex = nOldPlayer;
end;


--申请单方面离婚
function sure_process_dinglediv()
	if (check_marrystate() == 0) then
		return
	end;
	
	if (GetTask(TK_DATE_APPLYDIV) == 0) then
		Say("月老: 你想单方面离婚?", 2,
			"单方面离婚/singlediv_apply",
			"路过而已/no");
		return
	end;
	
	local nDays = get_passdays();
	local str = "申请离婚时间不够 <color=yellow>1 天<color>, ";
	if (nDays > 0) then
		str = format("你申请离婚才 <color=yellow>%d 天<color>, ",nDays);
	end;
	if (nDays < 7) then
		Say(format("月老: 你太心急了，%s还不够一周，回去好好想想吧",str), 0);
		return 0;
	end;
	
	Say(format("百年修得同船渡，千年修得共枕眠。单方面离婚需要交 <color=yellow>%d 两<color>. 你真的想断绝这段姻缘吗?", COSTOFSIMGLEDIV), 2,
		"办理单方面离婚手续/process_dinglediv",
		"让我想想/no");
end;

--进行单方面离婚
function process_dinglediv()
	if (GetCash() < COSTOFSIMGLEDIV) then
		Say(format("月老: 单方面离婚需要交 <color=yellow>%d<color> 两，你带的钱不够!",COSTOFSIMGLEDIV), 0);
		return 0;
	end;
	
	if (Pay(COSTOFSIMGLEDIV) == 0) then
		return
	end;
	
	divorce_dateproc(PlayerIndex);
	WriteLog(format("%s\tAccount:%s[Name:%s] 已进行单方面离婚.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));
	Say("月老: 现在你已离婚了，你可以去找与你过下半辈子的人了.", 0);
	
	Msg2Player(format("已交 <color=yellow>%d 两<color> 单方离婚费用.", COSTOFSIMGLEDIV));
	Msg2Player("婚姻状态为独身.");
	informother(divorce_dateproc);
	informother(Say, format("配偶 %s 到月老处申请<color=yellow>单方离婚<color>, 断绝夫妻关系.",GetName()), 0);
end;

--获得申请了多少天
function get_passdays()
	local nApplyDate = GetTask(TK_DATE_APPLYDIV);
	local nDate = GetCurServerTime();
	if (nApplyDate == 0 or nDate < nApplyDate) then
		return -1;
	end;
	
	local nDays = floor((nDate - nApplyDate) / TOTALSEC_OF_DAY);
	return nDays;
end;

--设置单方离婚设置
function divorce_dateproc()
	local nWorld67 = GetTask(67);
	nWorld67 = SetBit(nWorld67,24,0);
	SetTask(TK_DATE_APPLYDIV, 0);
	UnMarry();
	
	nRepute = GetRepute();				-- 声望相关处理
	if (nRepute > 10) then
		nRepute = 10;
	end;
	AddRepute(-1 * nRepute)								-- 声望10点(不足10点则降为0);
	
	nDivorceTimes = GetByte(nWorld67,2) + 1
	if (nDivorceTimes > 100) then
		nDivorceTimes = 100;
	end;
	nWorld67 = SetByte(nWorld67, 2, nDivorceTimes);
	SetTask(67,nWorld67);
end;

--检查婚姻和申请单方面离婚的状态
function check_marrystate()
	local nLvl = GetLevel();
	local nSex = GetSex();
	local bMarried = GetBit(GetTask(67),24);
	
	if (nLvl < 20) then
		Say("月老：不要和我开玩笑，你还未到成家立业的年纪.", 0);
		return 0;
	end;
	
	local str = "女的";
	if (nSex == 1) then
		str = "男的";
	end;
	
	if (bMarried == 0) then
		Say(format("月老：不要和我开玩笑，你还没结婚就来离婚，快去找%s结婚吧.", str), 0);
		return 0;
	end;
	return 1;
end;
function check_married_team()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		return 1;
	end;
	local mem = {};
	mem[1] = GetTeamMember(1);
	mem[2] = GetTeamMember(2);
	local szName = "";
	for i = 1, nTeamSize do
		PlayerIndex = mem[i];
		if (check_married() == 1) then --如果单方面离婚了
			szName = GetName();
			SetBit(GetTask(67),24,0);
			SetTask(67,1);
		end;
		PlayerIndex = nOldPlayer;
	end;
	if (szName == "") then
		return 1
	end;
	
	local str = format("<color=yellow>婚姻状态  %s 已改变<color>",szName)
	for i = 1, nTeamSize do
		OtherPlayer(mem[i], Msg2Player, str);
	end;
	return 1;
end;


function check_married()
	if (GetMateName() == "" and GetBit(GetTask(67),24) == 1) then
		return 1;
	end;
	return 0;
end;

----------------------- 七夕活动用9块爱恋巧克力换取奖励 ------------------
function chocolate()
	Say("9块巧克力可以换999万点经验值，也可以获得一些意外的奖励，你选择哪种?",3,"换999万点经验值/chocolate_exp","换奖品/chocolate_gift","没什么，我只是路过而已!/no");
end

function chocolate_exp()
	local nNowDate = tonumber(date("%d"));
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("好像你不够9块巧克力，记住，一块也不能少!",0);
		return
	end
	if(GetTask(1564) == nNowDate) then
		if(GetTask(1565) > 0) then
			Say("如果你用巧克力换经验值，每天只能换一次，还有，老人不要多吃甜的东西.",0);
			return
		end
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,GetTask(1565)+1);
	else
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,1);
		SetTask(1564,nNowDate);
	end
end

function chocolate_gift()
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("好像你不够9块巧克力，记住，一块也不能少!",0);
		return
	end
	ConsumeEquiproomItem( 9, 6, 1, 833, 1);	
	local i = random(1,1000);
	if(i <= 300) then
		AddEventItem(353);
		Msg2Player("你获得1 猩红宝石");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块猩红宝石");	
	elseif(i > 300 and i <= 460) then
		AddEventItem(238);
		Msg2Player("你获得1 蓝水晶");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块蓝水晶");		
	elseif(i > 460 and i <= 620) then
		AddEventItem(240);
		Msg2Player("你获得1 绿水晶");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块绿水晶");		
	elseif(i > 620 and i <= 800) then
		AddEventItem(239);
		Msg2Player("你获得1 紫水晶");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块紫水晶");		
	elseif(i > 800 and i <= 949) then
		AddItem(6,1,147,6,0,0);
		Msg2Player("你获得1 玄晶矿石级别为6");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块玄晶矿石级别为6 ");		
	elseif(i > 949 and i <= 979) then
		AddItem(6,1,147,7,0,0);
		Msg2Player("你获得1 块玄晶矿石级别为7");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块玄晶矿石级别为7");		
	elseif(i > 979 and i <= 989) then
		AddItem(6,1,147,8,0,0);
		Msg2Player("你获得1 玄晶矿石级别为8");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块玄晶矿石级别为8");		
	elseif(i > 989 and i <= 990) then
		AddItem(6,1,147,9,0,0);
		Msg2Player("你获得1 玄晶矿石级别为9");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块玄晶矿石级别为9");		
	elseif(i > 990 and i <= 1000) then
		AddItem(6,1,398,9,0,0);
		Msg2Player("你获得1 神秘矿石 ");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 在七夕节获得一块神秘矿石");		
	else
	end
end
----------------------- 七夕活动用9块爱恋巧克力换取奖励 ------------------

----------------------- 通用功能函数 ------------------
function default_talk()			-- 缺省对话
	Talk(1,"","如果双方有意在一起，只需要已长大，还未结婚，一起来这里结成良缘。你说你的求亲意向，我将代你传给她，帮你合成婚事")
end

function check_team()
	Player1_ID = GetTeamMember(1)
	Player2_ID = GetTeamMember(2)
-- 查询队伍中的女性成员，若有则记录她的ID到临时变量
	if (OtherPlayer(Player2_ID,GetSex) == 1) then
		His_ID = Player1_ID
		Her_ID = Player2_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	elseif (OtherPlayer(Player1_ID,GetSex) == 1) then
		His_ID = Player2_ID
		Her_ID = Player1_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	else
		His_ID = 0
		Her_ID = 0
	end
	return His_ID,Her_ID,His_world67,Her_world67
end

function do_qmarry_cancel()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (OtherPlayer(His_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,6) == His_ID) and (OtherPlayer(His_ID,GetTaskTemp,0,7) == Her_ID) then	-- 双方数据能对上，允许删除
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		OtherPlayer(Her_ID,SetTaskTemp,5,0)
		OtherPlayer(Her_ID,SetTaskTemp,6,0)
		OtherPlayer(Her_ID,SetTaskTemp,7,0)
--		Msg2Player("求婚取消成功。")
--	else
--		Msg2Player("无法取消求婚。")
	end
end

function OtherPlayer_talk(PlayerId, msg)		-- 为别人发消息
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId
	Talk(1,"",msg)
	PlayerIndex = OldPlayer
end
----------------------- 求婚相关 -----------------------
function Qmarry()			-- 求婚以及结婚合法性检测
	if (GetFaction() == "shaolin") or (GetFaction() == "emei") then		-- 和尚尼姑不准结婚
		Talk(1,"","你是出家人，怎么敢想红尘之事？放弃门规先吧")
	elseif (GetSex() == 1) then											-- 普通的对女性的说话
		Talk(1,"","成亲之事，你堂堂一个姑娘，怎么能那么主动，要等新郎来求婚!")
	elseif (GetTeamSize() ~= 2) or (IsCaptain() ~= 1) then		-- (队伍人员不对)或(自己不是队长)，转缺省对话
		default_talk()
	else					-- 检测各种条件，并且开始求婚过程
		His_ID,Her_ID,His_world67,Her_world67 = check_team();
--		check_married_team();
		if (Her_ID == 0) then				-- 队伍中无女性成员，转缺省对话
			Talk(1,"","你们两人堂堂男子汉，想结婚？不要唬弄月老!")
--			default_talk()
		elseif (OtherPlayer(Her_ID,GetFaction) == "emei") then		-- 不准娶尼姑
			Talk(1,"","想娶尼姑啊？如果你们真心相爱，最好是劝她还俗!")
		elseif (GetBit(His_world67,24) == 1) then				-- 男方已婚
			Talk(1,"","你已有妻子了，难道还想要三妻四妾!?")
		elseif (GetBit(Her_world67,24) == 1) then		-- 女方已婚
			Talk(1,"","<#> 人家"..OtherPlayer(Her_ID,GetName).."<#> 已经嫁过了，怎么能再嫁呢!")
		elseif (GetLevel() < 20) or (OtherPlayer(Her_ID,GetLevel) < 20) then		-- 有人等级不够
			Talk(1,"","你还小，婚姻大事等你大了再说!")
		else									-- 符合所有条件
			SetTaskTemp(7,Her_ID)
			SetTaskTemp(6,His_ID)
			Say("年轻人，是不是想和身边的姑娘结婚呢?",2,"是，我想向她提亲/qmarry_get","不是，我们只是偶然相遇/qmarry_no")
		end
	end
end

function qmarry_get()			-- 男方：启动提亲
	SetTaskTemp(5,1)
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (GetTaskTemp(7) ~= Her_ID) then			-- 队伍发生了改变，拒绝。。。
		Talk(1,"","你犹豫太久，姑娘已经走了!")
	else
		Her_Name = OtherPlayer(Her_ID,GetName)
		Talk(1,"","<#>很好，你和"..Her_Name.."<#> 果然是天生一对，我立即向她说，看看她的想法如何.")
		Msg2Player("<#> 你决定求婚 "..Her_Name.."<#> 把你的心思向月老说了，开始静静等待她的反应.")
		OtherPlayer(Her_ID,Msg2Player,GetName().."<#> 向你求婚，你同意嫁给他吗？快点向月老说你的心思吧.")
		OtherPlayer(Her_ID,SetTaskTemp,5,1)
		OtherPlayer(Her_ID,SetTaskTemp,6,His_ID)
		OtherPlayer(Her_ID,SetTaskTemp,7,Her_ID)
	end
end

function male_cancel()			-- 男方：取消提亲
	do_qmarry_cancel()
	Talk(1,"","强迫不幸福，如果她一时不能决定，就要等一段时日再说!")
	Msg2Player("你面前的美人有点害羞，放弃向她求婚的想法.")
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> 拒绝你的求婚.")		-- 消息是发到女方，注意消息内容相符
end

function male_hurry()		-- 求婚：催促
	Her_ID = GetTaskTemp(7)
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> 向你求婚，你同意嫁给他吗？快点向月老说你的心思吧!")
end

----------------------- 答复求婚、确认婚姻 -------------
function female_cancel()		-- 女方：拒绝提亲
	do_qmarry_cancel()
	Talk(1,"","你不愿意，我就告诉他这个消息!")
	Msg2Player("乌鸦总以为自己是天鹅啊？你没有犹豫就拒绝了他的求婚.")
	OtherPlayer(His_ID,Msg2Player,GetName().."<#> 已拒绝你的求婚，小子继续努力哦!")
end

function female_yes()			-- 女方：接受提亲
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	His_Name	= OtherPlayer(His_ID,GetName)
	Her_Name	= GetName()
	if (GetBit(Her_world67,24) == 1) then				-- 已婚
		Talk(1,"","你有夫君了，怎么还想嫁他人?")
	elseif (GetTeamSize() ~= 2) then		-- 队伍人数已改变
		Talk(1,"","我还没看到你的新郎，如果你想我帮助，需要一起来和我对话!")
	elseif (His_ID ~= GetTaskTemp(6)) then			-- 队长不是求婚者
		Talk(1,"","好像想和他人求婚？你到底想取谁?我有点糊涂了。")
	else				-- 数据已经对上，进行结婚处理
		DoMarry(GetTeam())
		
				-- 在这里判断婚姻关系是否真正确立，否则直接返回 by zero 2007/06/27
		local szMaleName, szFemaleName = "","";
		local nOldPlayerIndex = PlayerIndex;
		
			PlayerIndex = His_ID;
			szMaleName = GetMateName();
			PlayerIndex = nOldPlayerIndex;
			szFemaleName = GetMateName();
			
		if szMaleName == "" or szFemaleName=="" then
			Msg2Player("<color=yellow>未创建配偶关系，再试试!<color>");
			OtherPlayer(His_ID, Msg2Player, "<color=yellow>未创建配偶关系，再试试!<color>");
			return
		end;
		
		
		SetTaskTemp(5,0)		--取消求婚状态
		SetTaskTemp(6,0)
		SetTaskTemp(7,0)
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		Her_world67 = SetBit(Her_world67,24,1)		-- 设置结婚变量
		His_world67 = SetBit(His_world67,24,1)
		if (GetBit(Her_world67,2) == 0) and (GetLevel() >= 50) then		-- 女方送戒指
			Her_world67 = SetBit(Her_world67,2,1)		-- 设置结婚变量（已送戒指）
			present_ring(Her_ID)
		end
		if (GetBit(His_world67,2) == 0) and (OtherPlayer(His_ID,GetLevel) >= 50) then		-- 男方送戒指
			His_world67 = SetBit(His_world67,2,1)		-- 设置结婚变量（已送戒指）
			present_ring(His_ID)
		end
		SetTask(67,Her_world67)
		OtherPlayer(His_ID,SetTask,67,His_world67)

		Msg2Player("<#> 你接受求婚"..His_Name.."<#> 祝贺两位白头偕老，百年幸福!")
		OtherPlayer(His_ID, Msg2Player, Her_Name.."<#> 已接受他的求婚，祝贺两位白头偕老，百年幸福!")
		OtherPlayer_talk(His_ID, "恭喜两位，这条红线已经栓紧了两人的姻缘了!")
		OtherPlayer_talk(Her_ID, "恭喜两位，这条红线已经栓紧了两人的姻缘了!")
		AddGlobalCountNews("<#> 我们一起祝贺"..His_Name.."<#> 与"..GetName().."<#> 两位新人永结同心，白头偕老!",3)
		
	end
end

function present_ring(PlayerId)			-- 送戒指（判断、置变量已移至结婚过程中）
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId

	item_level = floor(GetLevel() / 10) + 2
	if (item_level > 10) then
		item_level = 10
	end
--	item_lucky = (item_level - 3) * 5
	p = {0,0,0,0,0,0}
	j = item_level - 6
	if (j > 6) then j = 6 end
	for i=1,j do
		if (item_level - i - 2 < 0) then
			p[i] = 0
		else
			p[i] = item_level - i - 2
		end
	end
	AddItem(0,3,0,item_level,random(0,4),5,p[1],p[2],p[3],p[4],p[5],p[6])
	Msg2Player("月老送给你一个戒指 ")
	PlayerIndex = OldPlayer
end

----------------------- 修复婚姻关系 -------------------
function fix_marry()
	if( GetTeamSize() == 2 ) then
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = GetName()
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (His_ID ~= 0) and (Her_ID ~= 0) and (GetBit(His_world67,24) == 1) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == "") and (OtherPlayer(Her_ID,GetMateName) == "") then		-- 异性、两人队伍、均已婚，则视为允许修复
			Talk(1,"","夫妻吵架是常事，不要因为这个就生气。来这里，两人握手言和!")
			DoMarry(GetTeam())
			Msg2Player("<#> 你和"..Her_Name.."<#> 已恢复配偶关系")
			OtherPlayer(Her_ID,Msg2Player,"<#> 你和"..His_Name.."<#>  已恢复配偶关系")
		elseif (GetBit(GetTask(67),24) == 1) and (GetMateName() == "") then			-- 可能修复，但对方条件不成立
			if (GetSex() == 0) then
				Talk(1,"","夫妻吵架是常事，这样吧，你和爱人一起来让我劝她!")
			else
				Talk(1,"","夫妻吵架是常事，这样吧，你和爱人一起来让我劝他!")
			end
		else			-- 自己条件不成立
			if (GetSex() == 0) then
				Talk(1,"","明明是没有事，你想骗我吗?")
			else
				Talk(1,"","明明是没有事，你想骗我吗!")
			end
		end
	else
		if (GetSex() == 0) then
			Talk(1,"","夫妻吵架是常事，这样吧，你和爱人一起来让我劝她!")
		else
			Talk(1,"","夫妻吵架是常事，这样吧，你和爱人一起来让我劝他!")
		end
	end
end

----------------------- 离婚相关 -----------------------
function divorce()
	if (GetTeamSize() == 2) and (IsCaptain() == 1) then		-- 组队、人数为2、自己是队长
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = OtherPlayer(His_ID,GetName)
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (GetBit(His_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == Her_Name) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(Her_ID,GetMateName) == His_Name) then		-- 双方结婚关系正确
			Say("离婚不是儿戏，江湖中人将因为你的离婚而给你不好的评价，要不要再想想?",2,"我们已经决定了，办理离婚手续吧!/divorce_yes","让我再想想/no")
		else
			Talk(1,"","你到底想和谁离婚？这个人不是你的配偶!")
		end
	else
		Talk(1,"","一定要离婚，需要你的妻子一起来办理离婚手续!")
	end
end

function divorce_yes()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (His_ID == 0) or (Her_ID == 0) or (OtherPlayer(His_ID,GetMateName) ~= Her_Name) or (OtherPlayer(Her_ID,GetMateName) ~= His_Name) then			-- 复查组队状态
		Talk(1,"","你犹豫太久，你的配偶已经走了!")
	elseif (GetCash() >= 50000) then
		Pay(50000)
		UnMarry(GetTeam())						-- 解除婚姻关系]
--Msg2Player("His_world67="..His_world67.."  Her_world67="..Her_world67)
		His_repute = OtherPlayer(His_ID,GetRepute)				-- 男方相关处理
		if (His_repute > 10) then His_repute = 10 end
		OtherPlayer(His_ID,AddRepute,-1 * His_repute)								-- 减男方声望10点(不足10点则降为0)
		His_DivorceTimes = GetByte(His_world67,2) + 1								-- 计算离婚次数
		if (His_DivorceTimes > 100) then His_DivorceTimes = 100 end			-- 超过100次不再记录
		His_world67 = SetByte(His_world67,2,His_DivorceTimes)						-- 离婚次数写入
		His_world67 = SetBit(His_world67,24,0)											-- 婚姻状态
--Msg2Player("His_world67="..His_world67)
		OtherPlayer_talk(His_ID,"如果是这样，两人目前的婚姻取消了，你恢复自由了.")		-- 为双方发离婚消息
		Her_repute = OtherPlayer(Her_ID,GetRepute)				-- 女方相关处理
		if (Her_repute > 10) then Her_repute = 10 end
		OtherPlayer(Her_ID,AddRepute,-1 * Her_repute)								-- 减女方声望10点(不足10点则降为0)
		Her_DivorceTimes = GetByte(Her_world67,2) + 1
		if (Her_DivorceTimes > 100) then Her_DivorceTimes = 100 end
		Her_world67 = SetByte(Her_world67,2,Her_DivorceTimes)
		Her_world67 = SetBit(Her_world67,24,0)
--Msg2Player("Her_world67="..Her_world67)

		OtherPlayer(His_ID,SetTask,67,His_world67)
		OtherPlayer(Her_ID,SetTask,67,Her_world67)
		OtherPlayer_talk(Her_ID,"如果是这样，两人目前的婚姻取消了，你恢复自由了.")
	else
		Talk(1,"","你带的手续费不够，需要五万两手续费!")
	end
end

----------------------- 合欢包相关 ---------------------
function gather_bonus()
	Say("不错, 3 合欢包, 3 鸳鸯帕及3 情意结就可以换1 块水晶和1 心心相映符\n 2 合欢包, 2 鸳鸯帕和2 情意结可以换1 块银元宝和1 心心相映符\n 1 合欢包, 1 鸳鸯帕和1 情意结可以换1 心心相映符\n 你想换哪种?",4,"我只换水晶和心心相映符 /gather_bonus1","我只换银元宝和心心相映符/gather_bonus2","我只换心心相映符/gather_bonus3","哦，对不起，我记错了!/no")
end

function gather_bonus1()
	if (GetItemCount(344) >= 3) then				-- 合欢包
		if (GetItemCount(345) >= 3) then			-- 鸳鸯帕
			if (GetItemCount(346) >= 3) then		-- 情意结
				for i=1,3 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- 心心相印符
				i = 238 + random(0,2)		-- 随机给一颗宝石
				AddEventItem(i)
				Talk(1,"","太好了! 我送你1 块水晶和1 块心心相映符.同时，祝两人的爱情亲密无间!")
			else
				Talk(1,"","你不够三个情意结， 找够了再来吧 ")
			end
		else
			Talk(1,"","你不够三个鸳鸯帕, 找够了再来吧")
		end
	else
		Talk(1,"","你不够三个合欢包, 找够了再来吧")
	end
end

function gather_bonus2()
	if (GetItemCount(344) >= 2) then				-- 合欢包
		if (GetItemCount(345) >= 2) then			-- 鸳鸯帕
			if (GetItemCount(346) >= 2) then		-- 情意结
				for i=1,2 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- 心心相印符
				AddEventItem(342)
				Talk(1,"","太好了! 我送你1 银元宝和1 块心心相映符。同时，祝两人的爱情亲密无间!")
			else
				Talk(1,"","你不够2个情意结， 找够了再来吧")
			end
		else
			Talk(1,"","你不够2个鸳鸯帕, 找够了再来吧")
		end
	else
		Talk(1,"","你不够2个合欢包, 找够了再来吧")
	end
end

function gather_bonus3()
	if (HaveItem(344) == 1) then				-- 合欢包
		if (HaveItem(345) == 1) then			-- 鸳鸯帕
			DelItem(344)
			DelItem(345)
			AddItem(6,1,18,1,0,0,0)			-- 心心相印符
			Talk(1,"","太好了! 我送你1 块心心相映符。同时，祝两人的爱情亲密无间!")
		else
			Talk(1,"","你没有鸳鸯帕, 找够了再来吧")
		end
	else
		Talk(1,"","你没有合欢包, 找够了再来吧")
	end
end

-------------- 2004-8-22 七夕送礼活动 ------------------
function present_QiXi( nPlayerIndex )
	local nPreservedPlayerIndex = PlayerIndex;
	
	PlayerIndex = nPlayerIndex;

	Talk( "今天是七月十五，月老送一个特别的礼物，祝2位白头偕老!" );
	-- 送2个“心心相印符”
	for i = 1, 2 do
		AddItem( 6, 1, 18, 1, 0, 0 ,0);
	end
	Msg2Player( "你获得2 心心相映符" );
	-- 送9朵“玫瑰花”
	for i = 1, 9 do
		AddItem( 6, 0, 20, 1, 0, 0 ,0);
	end	
	Msg2Player( "你获得 9 朵玫瑰!" );
	-- 50级以上玩家加送1个“天山玉露”
	if( GetLevel() >= 50 ) then
		AddItem(6, 1, 72, 1, 0, 0, 0);
		Msg2Player( "你获得一瓶天山宝露 " );
	end
	
	PlayerIndex = nPreservedPlayerIndex;
end

----------------------- end ----------------------------
function no()
end