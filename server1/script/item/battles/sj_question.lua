IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--增加玩家血量
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续半秒的血量回复"..(level*500).."<#>点")	
end


function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--增加玩家内力
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续半秒的内力回复"..(level*500).."<#>点")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--增加玩家血量持续恢复
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的血量回复，每半秒回复"..(level*100).."<#>点")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--增加玩家内力持续回复
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的内力回复，每半秒回复"..(level*100).."<#>点")	
end

function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的受伤动作减少："..(level*10).."<#>％")	
end

function add467()
		level = random(1,4);
		AddSkillState(467, level, 0, 1080 )	--玩家获得中毒时间减少
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的中毒时间减少："..(level*10).."<#>％")	
end

function add468()
		level = random(1,4);
		AddSkillState(468, level, 0, 1080 )
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的迟缓时间减少："..(level*10).."<#>％")	
end

function add469()
		level = random(1,4);
		AddSkillState(469, level, 0, 1080 )	--玩家获得眩晕时间减少
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的眩晕时间减少："..(level*10).."<#>％")	
end

function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--增加玩家血量和内力
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续半秒的血量回复"..(level*500).."<#>点和持续半秒的内力回复"..(level*500).."<#>点")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--增加玩家血量和内力持续恢复
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的血量回复，每半秒回复"..(level*100).."<#>点和持续30秒的内力回复，每半秒回复"..(level*100).."<#>点")	
end

function add473()
		level = random(1,7);
		AddSkillState(473, level, 0, 1080 )	--增加玩家普防
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的普防：增加"..(level*10).."<#>％")	
end

function add474()
		level = random(1,7);
		AddSkillState(474, level, 0, 1080 )	--增加玩家毒防
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的毒防：增加"..(level*10).."<#>％")	
end

function add475()
		level = random(1,7);
		AddSkillState(475, level, 0, 1080 )	--增加玩家冰防
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的冰防：增加"..(level*10).."<#>％")	
end

function add476()
		level = random(1,7);
		AddSkillState(476, level, 0, 1080 )	--增加玩家火防
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的火防：增加"..(level*10).."<#>％")	
end

function add477()
		level = random(1,7);
		AddSkillState(477, level, 0, 1080 )	--增加玩家雷防
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的雷防：增加"..(level*10).."<#>％")	
end

function add478()
		level = random(1,4);
		AddSkillState(478, level, 0, 1080 )	--增加玩家全抗
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的所有抗性：增加"..(level*10).."<#>％")	
end

function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--增加玩家内普伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系普攻伤害：增加"..(level*10).."<#>点")	
end

function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--增加玩家内毒伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系毒攻伤害：增加"..(level*10).."<#>点")	
end

function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--增加玩家内冰伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系冰攻伤害：增加"..(level*10).."<#>点")	
end

function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--增加玩家内火伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系火攻伤害：增加"..(level*10).."<#>点")	
end

function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--增加玩家内雷伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系雷攻伤害：增加"..(level*10).."<#>点")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--增加玩家外毒伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的外功系毒攻伤害：增加"..(level*10).."<#>点")	
end

function add486()
		level = random(1,4);
		AddSkillState(486, level, 0, 1080 )	--增加玩家外冰伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的外功系冰攻伤害：增加"..(level*10).."<#>点")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--增加玩家外普伤害百分比
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的外功系普攻伤害：增加"..(level*10).."<#>％")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 1080 )	--增加玩家血量上限
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续1分钟的血量上限增加："..(level*100).."<#>点")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 1080 )	--增加玩家内力上限
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续1分钟的内力上限增加："..(level*100).."<#>点")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--增加玩家血量和内力上限
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的内力上限增加："..(level*100).."<#>点和持续30秒的内力上限增加："..(level*100).."<#>点")	
end

function add493()
		level = random(1,3);
		AddSkillState(493, level, 0, 1080 )	--玩家获得增加跑速
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的移动速度：增加"..(level*10).."<#>％")	
end

function add495()
		level = random(10,20);
		AddSkillState(495, level, 0, 1080 )	--玩家获得增加跑速
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的攻击命中率：增加"..(level*10).."<#>％")	
end

function add496()
		level = random(1,2);
		AddSkillState(496, level, 0, 1080 )	--玩家获得增加跑速
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的武功出招动作：增加"..(level*10).."<#>％")	
end

Tab={add462,add463,add464,add465,add466,add467,add468,add469,add471,add472,add473,add474,add475,add476,add477,add478,add479,add480,add481,add482,add483,add485,add486,add487,add488,add489,add490,add493,add495,add496}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- 删除物品
	end
end

