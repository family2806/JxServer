--帮会特技图腾NPC
--Edit by 子非鱼℃
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- 同伴系统的支持
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--支持设定文件访问
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>帮会图腾柱: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>城市图腾柱: <link>"

--帮会图腾
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("你还没有加入帮会，是想来这参观吗?")
		return
	end
	
	local nstuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("这不是贵帮的领地，只是来参观一下.")
		return
	elseif (nstuntID == 0) then
			totempole_dec("帮会技能还没有开启，不能使用图腾柱，去告诉帮会领导开启技能")
			return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE) == 0 or TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE) == 1) then
		totempole_dec("帮会已经开启维修技能，现在不能使用图腾柱.")
		return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
			totempole_dec("帮会的战备资金不够维修这个技能，不能使用帮会技能!")
			return
	end
		--执行对应特技
		getglobal(TB_STUNTID_INFO[nstuntID].func)(nTongID, nstuntID)
end


function IsTakeStunt(nTongID,nStuntRight,nstuntID)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("你还没有加入帮会，是想来参观吗?")
		return
	end
	if (nstuntID == nil or nstuntID ~= TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)) then
		nstuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("这不是贵帮的领地，只是来参观一下.")
		return
	elseif (nstuntID == 0) then
			totempole_dec("帮会技能还没有开启，不能使用图腾柱，去告诉帮会领导开启技能")
			return
	elseif (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
			totempole_dec("帮会的战备资金不够维修这个技能，不能使用帮会技能!")
			return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("帮会技能已经过了保修期，现在不能接受，今天维修之后再来试试.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("领帮会技能的时间是20h00到22h00,按时去领.")
		return
	end
	
	if (nStuntRight == 1) then
	--管理特技的权限
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("本周的帮会技能已经领完了，下周再来吧.")
			end
		else
			totempole_dec("只有领导层才可以领这个帮会技能.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) ==  TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_STUNT_TAKED) >= TB_STUNTID_INFO[nstuntID].cntper) then
		totempole_dec("这周已经领取了帮会技能，不能再领了.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_STUNT_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("帮会技能每天只能领一次，明天再来吧")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) <= 0) then
		totempole_dec("今天已经领过帮会技能了，不能再领了.")
		return
	end
	
	--个人累积贡献度限制
	--if 个人累积贡献度 < MIN then return end
	return nTongID
end

function OnCancel()
end

--帮会特技：黄金令
function stunt_huangjinling(nTongID, nstuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nstuntID]

	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_HUANGJINLING.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>这个技能的时限是1周。今天允许了"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
	"接受技能/stunt_huangjinling1",
	"离开/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("背包需要<color=yellow>%d<color>空间.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		--这两句在这里其实不必要
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("得到1个<color=yellow>黄金令!<color>")
		Msg2Tong(nTongID, GetName().."得到1个黄金令")
		TONG_ApplyAddEventRecord(nTongID, GetName().."得到1个黄金令")
	end
end

--帮会特技：灵参力
function stunt_lingshenli(nTongID, nstuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_LINGSHENLI.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_LINGSHENLI.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
	"接受技能/stunt_lingshenli1",
	"离开/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("领到一个 <color=yellow>人参盒<color>, 立即开启领取千年人参的灵力.")
	else
		Msg2Player("领灵参力失败!")
	end
end

--112
function stunt_shiweiying(nTongID, nstuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_SHIWEIYING.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_SHIWEIYING.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
	"接受技能/stunt_shiweiying1",
	"离开/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("随行人数已经超过限定了，只有除去一人才可以领取这个技能。但是除去一个人太残忍了，你还是好好想想.")
		return
	end
	totempole_dec("为同行的人选五行.",
	"金系/stunt_shiweiying2",
	"木系/stunt_shiweiying2",
	"水系/stunt_shiweiying2",
	"火系/stunt_shiweiying2",
	"土系/stunt_shiweiying2",
	"我想想/OnCancel"	)
end

TB_SERIES_NAME = {"金", "木", "水", "火", "土"}
TB_CHARACTOR = {"勇猛","卫主","鲁莽","懦弱"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("为同行人选的五行是 "..TB_SERIES_NAME[nSel+1].." , 继续选性格.",
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
		totempole_dec("接受同行人员失败，再试一下.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50级需要经验
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
	totempole_dec("得到一个<color=yellow>系的同行人"..TB_SERIES_NAME[nseries+1].."<color>, 类型<color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--陶朱钱袋
function stunt_moneybox(nTongID, nstuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_MONEYBOX.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_MONEYBOX.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
	"接受技能/stunt_moneybox1",
	"离开/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
	totempole_dec("你得到1个<color=yellow>陶朱钱<color>,2天内有效!")

end

--无双杀阵--------------------------------
function stunt_wushuang(nTongID, nstuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_WSSZ.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>这个技能的时限是1周.", 
	"接受技能/wsh_getwushuangshazhen",
	"无双杀阵类型/wsh_typewushuangshazhen",
	"离开/OnCancel")
end

--领取 无双杀阵
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("背包要有<color=yellow>%d<color>空间.",5))
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
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --得到一个 无双杀阵
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 3 * 60 * 6);
		SyncItem(nItem)
		totempole_dec("得到<color=yellow>无双杀阵<color>.")
		Msg2Player("成功领取1个<color=yellow>无双杀阵<color>.");
		Msg2Tong(nTongID, GetName().."领帮会技能无双杀阵")
		TONG_ApplyAddEventRecord(nTongID, GetName().."领帮会技能无双杀阵")
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
	local szContent = "贵帮无双杀阵现在的模型是:<color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>模型<color>无双杀阵只有帮会中领导级别的人才可以变换.");
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
		szContent = "贵帮的无双杀阵还没有任何模型";
	end;
	
	Say(szContent.."你要进行什么操作?", 3, 
		"我想加模型/add_face", 
		"我想丢弃模型/removeface", 
		"离开/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("你选了10个模型，要想加入新的模型就要丢掉1个，要继续吗?", 2, "我行加入新模型./removeface", "我想想/no")
		return
	end;
	
	--写一个放入界面
	GiveItemUI("放入一张面具", "已经放入一张面具，等无双杀阵发挥作用就会变成希望的样子", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("放入的物品数量不对.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("放入的物品不是面具", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>伪装面具<color>不能做无双杀阵的模型.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("这个面具模型已经有了.", 0);
		return
	end;
	
	addoneface(nParticualrType); --增加一个外形
	Msg2Player("你已经把无双杀阵模型加入帮会了.");
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
			tinsert(tab_sel, "取消"..szMaskName.."做模型/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "让我好好想想/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("还没有选任何一个无双杀阵.", 0);
		return
	end;
	Say("想要取消那个模型?", getn(tab_sel), tab_sel);
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
	Msg2Player("取消1个帮会的无双杀阵模型.");
end;
-------------------------------------------------------------
--锻武魂-----
REPAREATT = 40; --每次增加多少耐久度
function stunt_duanwuhun(nTongID, nstuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_DWH.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_DWH.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
		"对的，用锻武魂来加固武器/dwh_Enhance", 
		"之后再说!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--进行强化武器
function EnhanceRepair(nItemIdx)
	
	local nDur = GetCurDurability(nItemIdx);
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "这个装备不能强化.")
	end
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>加固这个装备可以提高强度，每次增加<color=yellow>"..REPAREATT.."<color>点,最高强度是<color=yellow>"..(255).."<color>点, 现在装备的强度是<color=yellow>"..nDur.."<color>, 加固之后强度将是<color=yellow>"..nRepairDur.."<color>, 你想加固吗?",
		"加固/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"不必了/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "这个装备不能强化.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("装备被加固了");
	end;
end

function stunt_fenghuang(nTongID, nstuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nstuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_FHY.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_FHY.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
		"正是，我想领凤凰印/fhy_getfenghuangyin", 
		"之后再说!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("背包需要<color=yellow>%d<color>空间.",5))
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
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("你得到1个<color=yellow>凤凰印<color>.")
	Msg2Player("成功领取1个<color=yellow>凤凰印<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_TONG_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "结束对话/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>现在的帮会技能: "..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>接受技能权: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>维修特技费用"..
	"<enter><color=yellow>    "..(TB_STUNT_WUSHENBLESS.consume).."万战备费<color>"..
	"<enter>特技作用:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>这个技能的时限是1周，在1周中最多允许接受"..TB_STUNT_WUSHENBLESS.maxmem.."人来接受这个技能，每天每人只能领一次。今天还可以有"..TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT).."人来领技能.", 
	"接受技能/stunt_wushenbless1",
	"离开/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("背包需要<color=yellow>%d<color>空间.",5))
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
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_STUNT_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_STUNT_TAKED, GetTask(TASKID_STUNT_TAKED) + 1)
		totempole_dec("得到<color=yellow>武神赐福<color>, 使用之后将得到2小时的双倍贡献值(只对宋金活动，信使任务，挑战时间，武林连斗，杀贼，辉煌之夜).")
	else
		Msg2Player("领取武神赐福失败!")
	end
end;

-------获得到本日24时的时间差，单位：分
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;
