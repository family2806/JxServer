
---------------------------------------------------------------------------------
--  严重声明：此文件不抽字符串
---------------------------------------------------------------------------------

-- 礼官脚本
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\中秋活动.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- 任务变量ID of 玩家最后一次领取节日礼物时间
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- 临时任务变量ID of 玩家最后一次领取节日礼物时间
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- 主城奖励
Include("\\script\\event\\superplayeract2007\\event.lua")----超级玩家活动
Include("\\script\\event\\great_night\\event.lua")	-- 辉煌之夜
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- 兑换黄金装备金牌
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- 炼金活动


-- 越南0904解放活动
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- 越南0905生日活动
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:领奖方英豪奖励
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--交光环VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--弹出对话框
	tbDailog:AddOptEntry("辉煌之夜", onGreat_Night)
--	tbDailog:AddOptEntry("参加神秘宝箱活动", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("领武林第一帮终结奖", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("领取铜钱", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("我来换8月的 event 物品", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("开Pass箱", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("兑换10月的活动奖品", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("机器使用CSM帮助", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("参加 online 领奖", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("领取太守奖品", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("激新手活动", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("战士服道具", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("淬炼铁活动", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say("礼官: 现在是庆祝解放日活动期间，大人小孩都兴高采烈地庆祝胜利，大侠想参加吗?", 6, 
			"我来领取锦囊事件/jf0904_getjinnangshijian",
			format("胜利酒活动/#tbJiefang0904_jiu:OnDailogMain()"),
			"登顶FanXiPan活动/about_denggao",
			"轰烈千秋活动/about_shuizei",
			"消灭水贼任务/about_shuizei",
			"我只是看看!/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("我代表少林方丈感谢并祝福你!", 7, 
		"我把金莲花光环奉送给你/#v_mljaward(1)",
		"我把木莲花光环奉送给你/#v_mljaward(2)",
		"我把水莲花光环奉送给你/#v_mljaward(3)",
		"我把火莲花光环奉送给你/#v_mljaward(4)",
		"我把土莲花光环奉送给你/#v_mljaward(5)",
		"我把莲花光环奉送给你，每个系一个./v_mljaward_all",
		"我只是好奇路过看看而已!/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("你不想奉送"..tab_NPCIdx[nIdx][2].."吗? 你好像没有带"..tab_NPCIdx[nIdx][2].."!", 1, "我先去准备!/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("你已经奉送够"..tab_NPCIdx[nIdx][2].."了！奉送点别的吧!", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("太珍贵了！这是少林方丈和峨眉掌门送你的一点心意.", 1, "接受礼物./OnCancel");
	Msg2Player("你得到 <color=yellow>500000<color> 点经验.");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("你不想奉送"..tab_NPCIdx[i][2].."吗? 你好像没有带"..tab_NPCIdx[i][2].."!", 1, "我先去准备!/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("真是谢谢你！但是12个红包已经送完给人了.", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --加一个大风包；
	Say("太珍贵了！这是少林方丈和峨眉掌门送你的一点心意.", 1, "接受礼物./OnCancel");
	Msg2Player("你得到<color=yellow>1000000<color>点经验和1个<color=yellow>红包<color>");
end;

-- 节日列表
aryHoliday = {	-- 节日时间, 符合节日时间所调函数名, 重复领礼品的提示文本 
				{ 20040822, onHoliday_QiXi, "天气这么好！你们2位怎么不去游园呢，还在这干什么?" }
				-- 其它节日
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<#>今天是这些喜结良缘的人的好日子！我有礼物要送给结婚的人！祝各位白头偕老！")
			-- 送2个“心心相印符”
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<#>你得到两个心心相印符" );
			-- 送9朵“玫瑰花”
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<#>你得到9朵玫瑰!" );
			-- 50级以上玩家加送1个“天山玉露”
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<#>你得到一瓶天山宝露" );
			end
		else
			Talk(1, "", "<#>你不是已经领取过了吗?让别人来吧！")
		end
	else
		Talk(1, "", "<#>你还没有结婚，不能领礼物")
	end
end		 	
---------------- 取消 ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": 账户:" .. GetAccount() .. ", 人物:" .. GetName() .. "," .. object);
end
