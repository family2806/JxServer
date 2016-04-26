Include("\\script\\missions\\clearskill\\head.lua");
Include("\\script\\task\\system\\task_string.lua");

TTID_CityIndex 	= 101;

-- 洗点洞(第一层)相关功能
-- 返回值: -1 失败，1成功
function CSP_EnterClearMap(nCityIndex)
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "<#>壮士还没有达到等级"..CSP_NEEDLEVEL.."<#>, 不能进洗髓岛")
		return -1;
	end
	
	if (GetCamp() == 0) then
		Talk(1, "", "你没有任何技能，怎么也想去洗髓岛? ")
		return -1;
	end

	-- 将城市号记录到临时变量中
	SetTaskTemp(TTID_CityIndex, nCityIndex);
	
	-- 去洗髓岛的免费次数
	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- 免费进岛
		Say("<#>免费进入洗髓岛的机会只有"..CSP_MAXClearTime.."<#>次. 壮士想清楚了吗?", 2, "进入洗髓/CSP_FreeEnterClearMap", "休息一下/gotocsm_no")
		return 1;
	else
		-- 没有免费机会了，找水晶或宝石
		strNoFree = 
		{
			"<#>车夫: 免费次数已用完, 但是阁下可以使用<color=blue>睡觉(或白玉) <color>或<color=blue>猩红宝石(或紫玉) <color>进入洗髓岛. 这样你同意吗?",
			"<#>只洗技能点[3颗水晶]/CSP_JEnterClearMap_Skill",
			"<#>只洗技能点[白玉]/CSP_JEnterClearMap_Skill2",
			"<#>只洗潜能点[6颗猩红宝石]/CSP_JEnterClearMap_Prop",
			"<#>只洗潜能点[紫玉]/CSP_JEnterClearMap_Prop2",
			"<#>洗潜能和技能点[3颗水晶+ 6颗猩红宝石]/CSP_JEnterClearMap_All",
			"<#>洗潜能技能点[白玉+ 紫玉]/CSP_JEnterClearMap_All2",
			"<#>思考一下/CSP_Cancel"
		};
		-- Say(strNoFree[1], 7, strNoFree[2], strNoFree[3], strNoFree[4], strNoFree[5], strNoFree[6], strNoFree[7], strNoFree[8]);
		CreateTaskSay(strNoFree)
		return 1;
	end
	return 1;
end;

-- 免费进岛的机会
function CSP_FreeEnterClearMap()
	
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 全洗
	CSP_EnterClearMapCore();
end

-- 使用宝石换取进岛洗点的机会 - 技能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Skill()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","你没有带<color=blue>3颗水晶<color>.不要心急找够之后再来. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "你带来了很多水晶, 我们不好决定用哪3颗水晶帮你, 还是把剩余的水晶放在储物箱里? ")
		return -1;
	end

	-- 扣水晶
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end
	
	CSP_WriteLog("已使用"..nJCount.."水晶核, 进入洗髓岛");
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- 洗技能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛, 你可以不断洗技能点. ");

end;

-- 使用宝石换取进岛洗点的机会 - 潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","你没有带<color=red>6颗猩红宝石<color>.不要心急, 找齐了再来. ")
		return -1;
	end
	
	-- 扣猩红宝石(六颗)
	for i = 1, CSP_NEEDJEWEL_PROP do DelItemEx(353) end

	CSP_WriteLog("已使用"..CSP_NEEDJEWEL_PROP.."猩红宝石, 进入洗髓岛");
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- 洗潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛, 你可以一直洗潜能点. ");
end;

-- 使用宝石换取进岛洗点的机会 - 技能点&潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","你没有带<color=red>6颗猩红宝石<color>.不要心急, 找齐了再来. ")
		return -1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","你没有带<color=blue>3颗水晶<color>.不要心急, 找齐了再来. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "你带来了很多水晶, 我们不好决定用哪3颗水晶帮你, 还是把剩余的水晶放在储物箱里? ")
		return -1;
	end
	
	-- 扣猩红宝石(六颗)
	for i = 1,CSP_NEEDJEWEL_PROP do DelItemEx(353) end
	-- 扣水晶
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end	

	CSP_WriteLog("使用了"..nJCount.."水晶, 和"..CSP_NEEDJEWEL_PROP.."猩红宝石, 进入洗髓岛");
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 洗技能点和潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛,你可以无数次的洗技能点. ");
end;

function CSP_Cancel()
end

-- 进岛的核心函数
function CSP_EnterClearMapCore()
	-- 从临时变量中取出城市号
	nCityIndex = GetTaskTemp(TTID_CityIndex);
	nMapID = CSP_GetClearMapID(nCityIndex);
	-- 地图找不到，返回
	if (nMapID == -1) then
		CSP_WriteLog("区域ID:"..nMapID.."没找到, 进入洗髓岛失败!");
		return -1;
	end

	LeaveTeam();
	nResult = NewWorld(nMapID,1615,3200);
	if (nResult == 0) then
		CSP_WriteLog("区域ID:"..nMapID.."输入点数有误,进入洗髓岛失败!");
		Msg2Player("输入点数有误!");
		return -1;
	end
	
	-- 屏蔽某些功能：不能使用回城符、心心相映符，不允许摆摊
	DisabledUseTownP(1);
	DisabledUseHeart(1);
	DisabledStall(1);
	
	-- 设置非战斗状态
	SetFightState(0)
	
	-- 记录重生点(离开时复原)
	nSWID, nRevID = GetPlayerRev();
	SetTask(CSP_TID_RevivalSWID, nSWID);
	SetTask(CSP_TID_ReviveID, nRevID);
	
	-- 设置新的临时重生点
	SetRevPos(nMapID, CSP_RevieSWID);
	SetPunish(0);	
end;

-- 返回值: -1 失败，1成功
function CSP_LeaveClearMap(nClearMapID)
	nCityIndex = CSP_GetCityIndexByClearMap(nClearMapID);
	if (nCityIndex == -1) then
		return -1;
	end

	-- 恢复重生点(只有状态合法时，才重设重生点)
	if (CSP_CheckValid() == 1) then
		nSWID = GetTask(CSP_TID_RevivalSWID);
		nRevID = GetTask(CSP_TID_ReviveID);
		SetRevPos(nSWID, nRevID);
	end
		
	-- 关闭被屏蔽的功能：不能使用回城符、心心相映符，不允许摆摊
	DisabledUseTownP(0);
	DisabledUseHeart(0);
	DisabledStall(0);
	
	-- 离岛时离开队伍
	LeaveTeam();
	
	-- 设置非战斗状态
	SetFightState(0);
	SetPunish(1);
	SetLogoutRV(0);

	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- 免费进岛
		SetTask(CSP_TID_ClearFreeTime, nResult + 1) -- 记录免费次数
	else
		SetTask(CSP_TID_JewelEnterTime, GetTask(CSP_TID_JewelEnterTime) + 1) -- 记录使用宝石进入次数
	end
	

	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- 凤翔		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- 成都	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- 大理	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- 汴京
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- 襄阳
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- 扬州		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- 临安
	else
		Msg2Player("系统出错！请找服务人员确认解决问题. ");
	end	
end;


function CSP_JEnterClearMap_Skill2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","车夫: 你身上没<color=blue>白玉<color>. 是不是忘记在某处了?")
		return -1;
	end

	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("已使用 %d白玉,进入洗髓岛", CSP_NEEDJEWEL_SKILL2));
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- 洗技能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛, 你可以无数次的洗技能点. ");

end;

-- 使用宝石换取进岛洗点的机会 - 潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop2()
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","车夫: 你身上没有<color=red>紫玉<color>. 是不是忘记在某处了?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("已使用 %d紫玉,进入洗髓岛", CSP_NEEDJEWEL_PROP2));
	-- 记录进岛洗点类型
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- 洗潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛, 你可以无数次的洗技能点. ");
end;

-- 使用宝石换取进岛洗点的机会 - 技能点&潜能点
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","车夫: 你身上没有<color=blue>白玉<color>. 是不是忘记在某处了?")
		return -1;
	end
	
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","车夫: 你身上没有<color=red>紫玉<color>. 是不是忘记在某处了?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1 or ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("Х已使用 %d %s 和 %d %s, 进入洗髓岛",CSP_NEEDJEWEL_SKILL2, "白玉", CSP_NEEDJEWEL_PROP2, "紫玉") );
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- 洗技能点和潜能点
	CSP_EnterClearMapCore(); -- 进入洗髓岛
	Msg2Player("进入洗髓岛, 你可以无数次的洗技能点. ");
end;


