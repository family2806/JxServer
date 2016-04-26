--城市特技图腾NPC
--Edit by 子非鱼℃
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- 同伴系统的支持
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--支持设定文件访问
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>帮会标志: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>城市标志: <link>"

--城市图腾
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("你未加入帮会，想到这参观吗?")
		return
	end
	
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("这不是贵帮的领地，只是来参观而已.")
		return
	elseif (nStuntID == 0) then
			totempole_dec("贵帮帮会未打开城市技能，不能使用标志杆. 请通报帮会领导，在功能页可以打开城市技能?")
			return
	end
		--执行对应特技
		getglobal(TB_STUNTID_INFO[nStuntID].func)(nTongID, nStuntID)
end



function IsTakeStunt(nTongID,nStuntRight)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("你未加入帮会，想到这参观吗?")
		return
	end
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (nStuntID == 0) then
		print("不是占城帮会!")
		return
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("这不是贵帮的领地，只是来参观而已.")
		return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("城市技能已过保修期，目前不能领取。请再试试今天的保修时间.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("接收城市技能时间为20:00到22:00，在该时间内请来领技能.")
		return
	end
	
	if (nStuntRight == 1) then
	--管理特技的权限
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("本周城市技能已领完了，请等下周才能领.")
			end
		else
			totempole_dec("该城市技能只能帮会领导接收.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) == TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_CITYST_TAKED) >= TB_STUNTID_INFO[nStuntID].cntper) then
		totempole_dec("本周已接收城市技能了，不能再领了.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_CITY_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("每天帮会技能只能领一次，明天再来吧")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) <= 0) then
		totempole_dec("今天的城市技能已领完了，明天再来吧 ")
		return
	end
	
	--个人累积贡献度限制
	--if 个人累积贡献度 < MIN then return end
	return nTongID
end

function OnCancel()
end

--城市特技：黄金令
function stunt_huangjinling(nTongID, nStuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>技能有效期为7天. 今天依然允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
	"接收技能/stunt_huangjinling1",
	"离开/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("装备有 <color=yellow>%d<color> 空位.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		--这两句在这里其实不必要
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("获得 1 <color=yellow>黄金令!<color>")
		Msg2Tong(nTongID, GetName().."获得 1 城市技能黄金令")
		TONG_ApplyAddEventRecord(nTongID, GetName().."获得 1 城市技能黄金令")
	end
end

--城市特技：灵参力
function stunt_lingshenli(nTongID, nStuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_LINGSHENLI.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
	"接收技能/stunt_lingshenli1",
	"离开/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("获得1 <color=yellow>人参盒 <color>, 打开立即获得千年人参灵力.")
	else
		Msg2Player("领取灵力失败!")
	end
end

--112
function stunt_shiweiying(nTongID, nStuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_SHIWEIYING.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
	"接收技能/stunt_shiweiying1",
	"离开/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("同伴数量达上限，, 只有删掉一个同伴才能领该技能. 但是，删掉一个同行很残忍，你要三思")
		return
	end
	totempole_dec("选择你同伴的五行.",
	"金系/stunt_shiweiying2",
	"木系/stunt_shiweiying2",
	"水系/stunt_shiweiying2",
	"火系/stunt_shiweiying2",
	"土系/stunt_shiweiying2",
	"我想再想想/OnCancel"	)
end

TB_SERIES_NAME = {"金", "木", "水 ", "火", "土"}
TB_CHARACTOR = {"勇猛","卫主 ","流氓 ","懦弱"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("已选择同伴五行为 "..TB_SERIES_NAME[nSel+1].." , 请继续选择性格.",
	TB_CHARACTOR[1].."/stunt_shiweiying3",
	TB_CHARACTOR[2].."/stunt_shiweiying3",
	TB_CHARACTOR[3].."/stunt_shiweiying3",
	TB_CHARACTOR[4].."/stunt_shiweiying3",
	"结束对话/OnCancel"	)
end

function stunt_shiweiying3(nSel)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	local nseries = GetTaskTemp(112)
	local ncharactor = nSel + 1
	if (nseries == 0) then
		partnerIndex = PARTNER_AddFightPartner(5, 0, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 1) then
		partnerIndex = PARTNER_AddFightPartner(4, 1, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 2) then
		partnerIndex = PARTNER_AddFightPartner(2, 2, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 3) then
		partnerIndex = PARTNER_AddFightPartner(3, 3, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	else
		partnerIndex = PARTNER_AddFightPartner(1, 4, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	end
	if (partnerIndex == -1) then
		totempole_dec("接收同伴失败，请再试.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50级需要经验
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("获得一个同伴 <color=yellow>"..TB_SERIES_NAME[nseries+1].."<color>, 类型<color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--陶朱钱袋
function stunt_moneybox(nTongID, nStuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_MONEYBOX.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
	"接收技能/stunt_moneybox1",
	"离开/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("你获得1 <color=yellow>陶周钱<color>, 有效期为两天!")

end

--无双杀阵--------------------------------
function stunt_wushuang(nTongID, nStuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>该技能时间为7天.", 
	"接收技能/wsh_getwushuangshazhen",
	"无双杀阵类型/wsh_typewushuangshazhen",
	"离开/OnCancel")
end

--领取 无双杀阵
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("装备有 <color=yellow>%d<color> 空位.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WSSZ.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --得到一个 无双杀阵
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 120);
		SyncItem(nItem)
		totempole_dec("获得 <color=yellow>无双杀阵<color>.")
		Msg2Player("成功领取 1 <color=yellow>无双杀阵<color>.");
		Msg2Tong(nTongID, GetName().."获得城市技能 - 无双杀阵")
		TONG_ApplyAddEventRecord(nTongID, GetName().."获得城市技能- 无双杀阵")
	end;
	
	SetTaskTemp(193, 0);
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
MAPFILE = [[\settings\item\004\mask.txt]];
function wsh_typewushuangshazhen()
	local nMaskIdx;
	local szMaskName;
	local szContent = "贵帮无双杀阵的框架为 <color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), RIGHTID_STUNT);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>框架<color> 无双杀阵只有帮会领导才能改变.");
		return
	end
	
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_mask, szMaskName);
		end;
	end;
	
	if (getn(tab_mask) > 0) then
		szContent = szContent..tab_mask[1];
		for i = 2, getn(tab_mask) do
			szContent = szContent..", "..tab_mask[i];
		end;
		szContent = szContent.."<color>.";
	else
		szContent = "无双杀阵依然还没有什么框架 ";
	end;
	
	Say(szContent.."你想进行什么操作 ", 3, 
		"我想加入框架/add_face", 
		"我想减少框架/removeface", 
		"离开/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("你已选择10个框架，如果想增加新的模型需要减少框架 ", 2, "我想加入新的框架./removeface", "让我再想想/no")
		return
	end;
	
	--写一个放入界面
	GiveItemUI("请发你个人1个面具 ", "已放入一个面具，无双杀阵发挥作用后将变成想要的样子?", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("放入的物品数量不对.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("放入物品不是面具 ", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>伪装面具<color> 不能做无双杀阵框架.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("面具框架没有了.", 0);
		return
	end;
	
	addoneface(nParticualrType); --增加一个外形
	Msg2Player("你已给帮会放入无双杀阵框架.");
end;

function itemcheck(nParticualrType)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == nParticualrType) then
			return 0;
		end;
	end;
	return 1;
end;

function removeface()
	local tab_sel = {};
	_, nTongID = GetTongName();
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_sel, "放弃"..szMaskName.."造框架/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "让我想想/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("未选择无双杀阵框架.", 0);
		return
	end;
	Say("想放弃哪种框架 ", getn(tab_sel), tab_sel);
end;

function getfacecount()
	_, nTaskID = GetTongName();
	local nCount = 0;
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) ~= 0) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function addoneface(nValue)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == 0) then
			TONG_ApplySetTaskValue(nTaskID, TTK_FACE[i], nValue);
			return
		end;
	end;
end;

function deloneface(nIdx)
	_, nTaskID = GetTongName();
	if (nIdx < 1 or nIdx > 10) then
		return
	end;
	TONG_ApplySetTaskValue(nTaskID, TTK_FACE[nIdx], 0);
	Msg2Player("放弃1个帮会无双杀阵框架.");
end;
-------------------------------------------------------------
--锻武魂-----
REPAREATT = 40; --每次增加多少耐久度
function stunt_duanwuhun(nTongID, nStuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_DWH.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
		"对了，用练武魂加固武器 /dwh_Enhance", 
		"以后再说!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--进行强化武器
function EnhanceRepair(nItemIdx)
	
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "该装备不能强化.")
	end
	local nDur = GetCurDurability(nItemIdx);
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>加固该装备可以提高韧度，每次增加<color=yellow>"..REPAREATT.."<color> 点, 韧度最高为<color=yellow>"..(255).."<color> 点, 目前装备韧度为 <color=yellow>"..nDur.."<color>, 加固后的韧度为 <color=yellow>"..nRepairDur.."<color>, 你想修理吗?",
		"修理/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"不需要/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "该装备不能强化.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("装备得到加固 ");
	end;
end

function stunt_fenghuang(nTongID, nStuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_FHY.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
		"对了，我想领取凤凰印/fhy_getfenghuangyin", 
		"以后再说!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("装备有 <color=yellow>%d<color> 空位.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_FHY.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("你获得1 <color=yellow>凤凰印<color>.")
	Msg2Player("成功领取 1<color=yellow>凤凰印<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_CITY_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "结束对话/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."城市技能"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>接收技能权利: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>特效技能作用:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>技能时限为7天，在该时间内允许最多"..TB_STUNT_WUSHENBLESS.maxmem.." 接收技能的人，每天每人只能获得一次。今天还允许"..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." 你来领该技能.", 
	"接收技能/stunt_wushenbless1",
	"离开/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("装备有 <color=yellow>%d<color> 空位.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WUSHENBLESS.right)) then
		return
	end
	local nItemIdx = AddItem(6, 1, 1264, 1, 1, 1);
	if (nItemIdx > 0) then
		local nlasttime = getExpiredTime2DayEnd() * 60;
		local nlastday = 7 - tonumber(GetLocalDate("%w"));
		if (nlastday == 7) then
			nlastday = 0;
		end;
		local ntime = GetCurServerTime() + nlasttime + nlastday * 24 * 60 * 60;
		
		SetSpecItemParam(nItemIdx, 1, ntime);
		SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
		SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
		SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
		SyncItem(nItemIdx);
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("获得 <color=yellow>武神四福<color>, 使用后将获得2小时双倍贡献度(只有宋金活动，信使任务，时间挑战，武林联赛，野叟，辉煌夜).")
	else
		Msg2Player("领取武神四福失败!")
	end
end;

-------获得到本日24时的时间差，单位：分
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;
