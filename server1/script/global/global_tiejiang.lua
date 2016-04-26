

Include("\\script\\global\\recoin_goldenequip.lua")
Include("\\script\\global\\equipenchase_help.lua") 
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\紫色及黄金装备铸造.lua")
Include("\\script\\global\\shenmi_chapman.lua");	--修装备功能



Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")



--------固定对话 城市--------
function tiejiang_city(...)
	
	local nNpcIndex = GetLastDiagNpc();
	--local szNpcName = GetNpcName(nNpcIndex);
	--if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local szNpcName = "铁匠"
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	local aryParam = arg;
	
	if (getn(aryParam) == 0) then
		tbDailog.szTitleMsg = TIEJIANG_DIALOG
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tbDailog.szTitleMsg = TIEJIANG_DIALOG
			else
				local _,_, szOpt, szFun = strfind(aryParam[i], "([^/]+)/([^/]+)")
				local fn = getglobal(szFun)
				if fn then
					tbDailog:AddOptEntry(szOpt, fn);	
				end
			end;
		end;
	end;
	
	
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg, "<dec>", "")
	
	
	tbDailog:AddOptEntry("交易", yes);
	tbDailog:AddOptEntry("精炼石商店", energy_sale);
	tbDailog:AddOptEntry("交易", yes);
	
	tbDailog:AddOptEntry("物品铸造", onFoundry);
	
	tbDailog:AddOptEntry("物品镶嵌", jewel_yes);
	tbDailog:AddOptEntry("处理<损坏的装备>", deal_brokenequip);
	tbDailog:AddOptEntry("我是来做教育任务", education_tiejiang);	
	--tbDailog:AddOptEntry("我随便逛逛", no, {});
	tbDailog:Show()
end;
--------固定对话 新手村------
function tiejiang_village(...)
	local aryParam = arg;
	local aryDescribe = {
		--szDialog,		--铁匠的说话，在各城市铁匠处
		"交易/yes",
		
		--Change request 04/06/2011, ng ch? t筼 trang b? b筩h kim - Modified by DinhHQ - 20110605
		--"V藅 ph萴 c/onFoundry",
		
		"教育任务/tboss",
		"我随便逛逛/no",
	};
	
	if (getn(aryParam) == 0) then
		tinsert(aryDescribe, 1, TIEJIANG_DIALOG)
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tinsert(aryDescribe, 1, aryParam[i]);
			else
				tinsert(aryDescribe, 2, aryParam[i]);
			end;
		end;
	end;
	CreateTaskSay(aryDescribe);
end;

--------镶嵌--------
function jewel_yes()
	CreateTaskSay({"<dec><npc>水晶镶嵌涉及五行平衡、灵气运转之法，绝非人力可测，未必真能如你所希望变成绝世极品；而武器图谱和域外奇珍则能成功改变装备的等级。你真的决定镶嵌你的装备吗？", "开始镶嵌/jewel_yes1", "关于镶嵌/help", "我再想想/no"});
end

function jewel_yes1()
	EnchaseItem()
end

-------No--------
function no()
end;

------精炼石-------
function energy_sale()
	CreateStores();
	AddShop2Stores(174, "精炼商店", 15, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(179, "活动商店", 1, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(93, "福缘商店", 2, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(98, "宋金商店", 4, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(146, "荣誉商店", 11, 100, "fBuyCallBack(%d,%d)");
	AddShop2Stores(173, "威望商店", 13, 100, "fBuyCallBack(%d,%d)");
	OpenStores();
end

function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- 试炼帖
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- 玄天锦囊
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- 青驹令
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- 云鹿令
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- 苍狼令
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- 玄猿令
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- 紫蟒令
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- 如意钥匙
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- 炎帝令
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
