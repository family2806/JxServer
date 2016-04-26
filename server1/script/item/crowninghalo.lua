Include([[\script\lib\string.lua]]);
Include([[\script\lib\coordinate.lua]]);
IL("TIMER")
IL("TONG")
MAPFILE = [[\settings\item\004\mask.txt]];

--====Task Value====--
TIMER_ID	= 78				-- ID，填写在\settings\timertask.txt
TIMER_LAST	= 3 * 60 * 60 * 18	-- 可使用总时间，10分钟
TIMER_FREQ	= 10 * 18			-- 释放频率，5秒
USE_YES = 1						-- 正在使用
USE_NO = 0						-- 没有使用

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
WSSZ_TK_USING = 1758		--是否正在使用无双杀阵
TK_MASK = 1759;				--无双杀阵面具的Idx

function main(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	
	if (nRestCount <= 0) then
		Say("无双杀阵已打开，是否要关闭？", 2, "关闭/#closebook("..nItem..")", "暂时不要/no")
			--, "再给一本/addbook", "选择我想要的面具/selectface")
	else
		Say("无双杀阵已关闭，是否要打开？", 2, "打开/#openbook("..nItem..")", "暂时不要/no")
		--, "再给一本/addbook", "选择我想要的面具/selectface")
	end
	return 1;
end

function addbook()
	local nItem = AddItem(6,1,1106,1,0,0,0)	-- 要填一个新物品在magicscript.txt
	set_rest_count(nItem, TIMER_LAST/TIMER_FREQ)
end

function openbook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --得到物品类别
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	
	if (GetTask(WSSZ_TK_USING) == USE_YES) then
		Say("你已经打开一个无双杀阵", 0);
		Msg2Player("你已经打开一个无双杀阵");
		return
	end;
	
	SetTaskTemp(193, nItem);
	local nMaskIdx = GetItemParam(nItem, 2);
	Say("该无双杀阵还没有选择表现造型，可以从已有造型种添加一个。否则，你和你受无双杀阵影响的朋友将以刺猬的外形出现，你确实不需要选择造型吗？", 2, 
	"我要选择独特的造型/sel_face", 
	"我觉得刺猬外形不错/select_no");
end

function sel_face()
	nItem = GetTaskTemp(193);
	_, nTongID = GetTongName();
	local tab_face = {};
	local nMaskIdx;
	local szMaskName = "";
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_face, szMaskName.."外形不错/#sel_mask("..i..")");
		end;
	end;
	
	if (getn(tab_face) == 0) then
		Say("贵帮目前没有添加无双杀阵的外形，帮主跟长老可以到帮会图腾去增删或者修改。最多拥有十个。你确实要使用无双杀阵吗？", 2,
		"是的，我觉得刺猬外形不错/select_no",
		"结束对话/no");
		return
	end;
	
	tinsert(tab_face, "结束对话/no");
	Say("贵帮目前无双杀阵拥有的外形包括以下一些，最多拥有十个，帮主跟长老可以到帮会图腾去增删或者修改。你要选择哪个作为这次使用的模型", getn(tab_face), tab_face);
end;

function select_no()
	SetTask(TK_MASK, 35);
	start_book(0);
end;

function sel_mask(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	local nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	if (nMask == 0) then
		nMask = 35;
	end
	SetTask(TK_MASK, nMask);
	
	SetSpecItemParam(nItem, 2, nMaskIdx);
	SyncItem(nItem);
	start_book(nMaskIdx)
end;
	
function start_book(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	
	_, nTongID = GetTongName();
	local nRestCount = GetItemParam(nItem, 1)
	local nRestTime = getresttime(nRestCount) * 18;
	local nMask = 35;
	if (nMaskIdx > 0 and nMaskIdx <= 10) then
		nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	end;

	if (nRestCount > 0) then
		-- TM_SetTimer(频率，ID，次数，类型：0-下线消失,1-真实时间,2-在线时间)
		TM_SetTimer(TIMER_FREQ, TIMER_ID, nRestCount, 2)
		nt_setTask(WSSZ_TK_USING, USE_YES);
		set_rest_count(nItem, 0)
		
		emitskill(nMask, nRestCount)
		Msg2Player("你打开了一个无双杀阵！")
	end
end

function getresttime(nTimes)
	if (nTimes <= 0) then
		return 0
	end;
	return nTimes * 5;
end;

function closebook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --得到物品类别
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	if (nRestCount <= 0) then
		nRestCount = TM_GetRestCount(TIMER_ID)
		-- 这里还要判断一下现在timer里面的技能和该无双杀阵是不是配套（如果有多种无双杀阵的话）
		-- if (不配套) then nRestCount = 0 end
		TM_StopTimer(TIMER_ID)
		if (not nRestCount or nRestCount <= 0) then
			Msg2Player("该无双杀阵已耗尽！")
			RemoveItemByIndex(nItem)
		else
			ChangeOwnFeature( 1, 0, 12);
			SetPkReduceState(0, 80, 80, 50);
			Msg2Player("无双杀阵已关闭！")
			set_rest_count(nItem, nRestCount)
		end
		nt_setTask(WSSZ_TK_USING, USE_NO);
	else
		Say("你没有打开这个无双杀阵", 0);
		Msg2Player("你没有打开这个无双杀阵");
	end
end

function GetDesc(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	if (nRestCount <= 0) then
		return "<color=blue>该无双杀阵已打开<color>"
	else
		return format("<color=blue>该无双杀阵尚可使用%d小时%.2f分钟<color>", floor(nRestCount / 360), mod(nRestCount, 360) / 6)
	end
end

function set_rest_count(nItem, nRestCount)
	SetSpecItemParam(nItem, 1, nRestCount)
	SyncItem(nItem)
end

function no()
	SetTaskTemp(193, 0);
end

function OnTimer()
	local nRestCount = TM_GetRestCount(TIMER_ID)

	if (nRestCount == 0) then --如果次数为0；
		nt_setTask(WSSZ_TK_USING, USE_NO);
		Msg2Player("该无双杀阵已经耗尽。")
		return
	end
	
	_, nTongID = GetTongName();
	local nMask = GetTask(TK_MASK);
	
	emitskill(nMask, nRestCount);
	if (mod(nRestCount, 30) == 0 and nRestCount > 0) then
		Msg2Player("你打开了<color=yellow>无双杀阵<color>，还可以作用<color=yellow>"..floor(nRestCount / 360).."<color>小时<color=yellow>"..floor(mod(nRestCount, 360) / 6).."<color>分钟。");
	end;
end

function emitskill(nMask, nRestCount) --发技能
	local nCamp = GetCamp();
	local nTongID;
	_, dwTongID = GetTongName();
	local tab_P = GetMapPlayerList( nCamp, 1, dwTongID );--这里搜寻全帮
	local nOrgPlayerIdx = PlayerIndex;
	--遍历，然后再设上技能  
	local nRestTime = 15 * 18;
	local nMaskIdx = gettabfiledata(MAPFILE, nMask + 2, 15);
	
	for i = 1, getn(tab_P) do
		PlayerIndex = tab_P[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(nRestTime, 80, 80, 50);
			--变样子
			ChangeOwnFeature( 1, nRestTime, nMaskIdx);
		end;
	end
	
	PlayerIndex = nOrgPlayerIdx;
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end
