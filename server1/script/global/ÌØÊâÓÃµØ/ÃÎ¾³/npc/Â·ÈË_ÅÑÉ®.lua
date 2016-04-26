-- 梦境 路人_叛僧.lua  洗点功能NPC

Include("\\script\\missions\\clearskill\\clearhole.lua");

function main()
	-- 非法状态
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("进入洗髓岛不正常. ");
		Say("GM: <color=red>你不能进洗髓岛，已被系统记录，请去找服务的人调整好! <color> ", 1, "离开洗髓岛/LeaveHere_yes")
		return -1;
	end
	
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "你的等级还未达到"..CSP_NEEDLEVEL.."不能离开洗髓岛. ")
		return -1;
	end

	nType = GetTask(CSP_TID_ClearType);
	if (nType == CSP_CTYPE_SKILL) then -- 只洗技能点
		local tbOpt = 
		{
			"洗技能点/DoClearSkill",
			"洗潜能点/add_prop",
			"不洗/OnCancel",
			"关于洗髓/Help",
			"离开洗髓岛 /LeaveHere",
		}
		Say("你只能洗 <color=blue> 技能点<color>. 同意洗吗？", getn(tbOpt), tbOpt)
	elseif (nType == CSP_CTYPE_PROP) then -- 只能潜能点
		local tbOpt = 
		{
			"洗潜能点/DoClearProp",
			"增加潜能点/add_prop",
			"不洗 /OnCancel",
			"关于洗髓 /Help",
			"离开洗髓 /LeaveHere",
		}
		Say("你只能洗<color=blue> 潜能点<color>. 同意洗吗? ", getn(tbOpt), tbOpt)
	else -- if (nType == CSP_NEEDJEWEL_ALL) then -- 全洗(nType可能是0，或3)
		local tbOpt = 
		{
			 "洗技能点/DoClearSkill",
			 "洗潜能点/DoClearProp", 
			 "增加潜能点/add_prop", 
			 "不洗 /OnCancel", 
			 "关于洗髓/Help", 
			 "离开洗髓岛/LeaveHere"
		}
		Say("你同意洗髓吗? ", getn(tbOpt),tbOpt)
	end;
end

function add_prop()
	Say("说明：你想自己什么技能值?", 4,
			"增加力量/add_prop_str",
			"自己身法/add_prop_dex",
			"自己外功/add_prop_vit",
			"自己内功/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "请输入力量数值: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "请输入身法数值: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "请输入外功数值:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "亲输入内功数值: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end

function DoClearSkill()
	Say("你同意洗技能值吗? ", 2, "洗技能值/DoClearSkillCore","不洗/OnCancel")
end
function DoClearSkillCore()
--	if (Pay(100000) == 0) then
--		Say("释明：对不起，每次洗髓需10万两，你身上带的钱不够。", 0)
--		return
--	end

	i = HaveMagic(210)		-- 轻功另外操作
	j = HaveMagic(400)		-- “劫富济贫”另外操作
	n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
	x = 0
	if (i ~= -1) then x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	rollback_point = n - x			-- 把技能点当做空闲点数返还，但先扣除轻功等
	if (rollback_point + GetMagicPoint() < 0) then		-- 如果洗成了负数，则当作0（为以后多次洗点保留）
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
	Msg2Player("洗髓成功！你已经可以分配点了"..rollback_point.."技能点可以重新分配. ")
	Talk(1,"KickOutSelf","洗髓成功！你已经可以分配点了"..rollback_point.."技能点可以重新分配. ")
end;

function DoClearProp()
	Say("你同意洗潜能点吗? ", 2, "洗潜能点/DoClearPropCore", "不洗/OnCancel")
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- 五行人物的天生属性值
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- 将已分配潜能重置（task(88)是任务中直接奖励的力量、身法等）
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function OnCancel()
end;

function Help()
	strHelp = 
	{
		"洗髓之后，你可以到外面打木人，或者团体一起进入山洞实践战斗，然后离开岛才能算是完成. ",
		"只需要你不离开岛，我将帮助你洗髓?",
		"外面有木桩(3000生力) ;  沙包(10000生力) ; 木人（30000 生力) 让人实践洗髓效果!",
		"如果想比赛，可以进山洞，尽管有失败，也不会有什么损失",
		"如果山洞里面就很窄，最多也只容纳20人，所以如果已经够人了就不用进入了. ",
		"如果山洞里面就很窄，最多也只容纳20人，所以如果已经够人了就不用进入了. ",
		"最后，什么时候感觉技能点够了就来找我，我会带你返回老地方"
	}
	Talk(7, "", strHelp[1], strHelp[2], strHelp[3], strHelp[4], strHelp[5], strHelp[6], strHelp[7]);
end;

function LeaveHere()
	Say("你以为已洗髓完了啊？有想离开吗? ",2, "想离开/LeaveHere2", "任务认真想想/OnCanCel")
end

function LeaveHere2()
	Say("离开洗髓岛，如果想返回将很难，你依然坚决离开啊？", 2, "我真的想离开这个鬼地方 /LeaveHere_yes", "我依然想留下/OnCanCel")
end

function LeaveHere_yes()
	W,X,Y = GetWorldPos();
	LeaveTeam()
	CSP_LeaveClearMap(W);
end
