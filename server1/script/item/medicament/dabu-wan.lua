-- by yfeng

if not BAN_HEAD then
	Include("\\script\\global\\ban.lua")
end

function main(itemIdx)
	local mapid,_,_ = GetWorldPos()
	if(checkSJMaps(mapid)) then
		Msg2Player("宋金战场内不能服用大补丸。")
		return 1
	end
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --攻速丸
		AddSkillState(511,15,1,18*180)
		return 0
	end
	if(detail == 219) then --跑速丸
		AddSkillState(512,15,1,18*180)
		return 0
	end
	if(detail == 220) then --普防丸
		AddSkillState(513,20,1,18*180)
		return 0
	end
	if(detail == 221) then --毒防丸
		AddSkillState(514,20,1,18*180)
		return 0
	end
	if(detail == 222) then --冰防丸
		AddSkillState(515,20,1,18*180)
		return 0
	end
	if(detail == 223) then --火防丸
		AddSkillState(516,20,1,18*180)
		return 0
	end
	if(detail == 224) then --雷防丸
		AddSkillState(517,20,1,18*180)
		return 0
	end
	if(detail == 225) then --减伤丸
		AddSkillState(518,20,1,18*180)
		return 0
	end
	if(detail == 226) then --减晕丸
		AddSkillState(519,20,1,18*180)
		return 0
	end
	if(detail == 227) then --减毒丸
		AddSkillState(520,20,1,18*180)
		return 0
	end
	if(detail == 228) then --减冰丸
		AddSkillState(521,20,1,18*180)
		return 0
	end
	if(detail == 229) then --普攻丸
		AddSkillState(522,10,1,18*180)
		return 0
	end
	if(detail == 230) then --毒攻丸
		AddSkillState(523,10,1,18*180)
		return 0
	end
	if(detail == 231) then --冰攻丸
		AddSkillState(524,10,1,18*180)
		return 0
	end
	if(detail == 232) then --火攻丸
		AddSkillState(525,10,1,18*180)
		return 0
	end
	if(detail == 233) then --雷攻丸
		AddSkillState(526,10,1,18*180)
		return 0
	end
	if(detail == 234) then --长命丸
		AddSkillState(527,10,1,18*180)
		return 0
	end
	if(detail == 235) then --长内丸
		AddSkillState(528,10,1,18*180)
		return 0
	end

end

function GetDesc(itemIdx)
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --攻速丸
		return "<color=blue>3分钟内：\n外功系武功攻击速度：增加30%\n内功系武功攻击速度：增加30%<color>"
	end
	if(detail == 219) then --跑速丸
		return "<color=blue>3分钟内：\n移动速度：增加30%<color>"
	end
	if(detail == 220) then --普防丸
		return "<color=blue>3分钟内：\n普防：增加40%<color>"
	end
	if(detail == 221) then --毒防丸
		return "<color=blue>3分钟内：\n毒防：增加40%<color>"
	end
	if(detail == 222) then --冰防丸
		return "<color=blue>3分钟内：\n冰防：增加40%<color>"
	end
	if(detail == 223) then --火防丸
		return "<color=blue>3分钟内：\n火防：增加40%<color>"
	end
	if(detail == 224) then --雷防丸
		return "<color=blue>3分钟内：\n雷防：增加40%<color>"
	end
	if(detail == 225) then --减伤丸
		return "<color=blue>3分钟内：\n受伤动作时间：减少40%<color>"
	end
	if(detail == 226) then --减晕丸
		return "<color=blue>3分钟内：\n眩晕时间：减少40%<color>"
	end
	if(detail == 227) then --减毒丸
		return "<color=blue>3分钟内：\n中毒时间：减少40%<color>"
	end
	if(detail == 228) then --减冰丸
		return "<color=blue>3分钟内：\n迟缓时间：减少40%<color>"
	end
	if(detail == 229) then --普攻丸
		return "<color=blue>3分钟内：\n外功系普攻伤害：增加200%\n内功系普攻伤害：增加100点<color>"
	end
	if(detail == 230) then --毒攻丸
		return "<color=blue>3分钟内：\n外功系毒攻伤害：增加10点/次\n内功系毒攻伤害：增加10点/次<color>"
	end
	if(detail == 231) then --冰攻丸
		return "<color=blue>3分钟内：\n外功系冰攻伤害：增加100点\n内功系冰攻伤害：增加100点<color>"
	end
	if(detail == 232) then --火攻丸
		return "<color=blue>3分钟内：\n外功系火攻伤害：增加100点\n内功系火攻伤害：增加100点<color>"
	end
	if(detail == 233) then --雷攻丸
		return "<color=blue>3分钟内：\n外功系雷攻伤害：增加100点\n内功系雷攻伤害：增加100点<color>"
	end
	if(detail == 234) then --长命丸
		return "<color=blue>3分钟内：\n生命上限：增加1000点<color>"
	end
	if(detail == 235) then --长内丸
		return "<color=blue>3分钟内：\n内力上限：增加1000点<color>"
	end

end
