Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua"), nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng--给玩家累加经验的公共函数

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--danh, nh薾 頲 ph莕 thng次的文字描述
TB_STORM_LADDERNAME, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{"Qu竛, nh薾 頲 ph莕 thngqu﹏",, nh薾 頲 ph莕 thng"�, nh薾 頲 ph莕 thngqu﹏",, nh薾 頲 ph莕 thng"H筺g, nh薾 頲 ph莕 thng3",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng4",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng5",
	"H筺g, nh薾 頲 ph莕 thng6",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng7",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng8",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng9",, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thngH筺g, nh薾 頲 ph莕 thng10",, nh薾 頲 ph莕 thng"kh玭g, nh薾 頲 ph莕 thngc�, nh薾 頲 ph莕 thngtrong, nh薾 頲 ph莕 thngb秐g, nh薾 頲 ph莕 thngx誴, nh薾 頲 ph莕 thngh筺g",, nh薾 頲 ph莕 thng"Kh玭g, nh薾 頲 ph莕 thngc�, nh薾 頲 ph莕 thngx誴, nh薾 頲 ph莕 thngh筺g"}

--武林盟传人	
STORM_WLMCR, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V�, nh薾 頲 ph莕 thngl﹎, nh薾 頲 ph莕 thngtruy襫, nh薾 頲 ph莕 thngnh﹏<link>"

--检查指定的awardtype
--awardid, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil	返回：积ph髏+/-排行	可以l穘h取的所有奖励
--awardid, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0		返回：nil不可以l穘h取	否则返回积ph髏+/-排行
function, nh薾 頲 ph莕 thngstorm_checkaward(awardtype,, nh薾 頲 ph莕 thngawardid)
	storm_anotherday()
	
	if, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil, nh薾 頲 ph莕 thngor, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
		return, nh薾 頲 ph莕 thngnil
	end
	
	if, nh薾 頲 ph莕 thng(GetTask(TB_STORM_AWARD[awardtype][3]), nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
		Say("Xin, nh薾 頲 ph莕 thngl鏸!, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][1].."ph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngc馻, nh薾 頲 ph莕 thngngi, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thngnh薾, nh薾 頲 ph莕 thngqua, nh薾 頲 ph莕 thngr錳!",, nh薾 頲 ph莕 thng0)
		return, nh薾 頲 ph莕 thngnil
	end
	
	local, nh薾 頲 ph莕 thngawardvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng0
	if, nh薾 頲 ph莕 thng(TB_STORM_AWARD[awardtype][2], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen
		awardvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng-storm_getrank(awardtype)	--用负数作比较更方便
	else
		awardvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngGetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if, nh薾 頲 ph莕 thng(awardid, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
		local, nh薾 頲 ph莕 thngtb_award, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
		local, nh薾 頲 ph莕 thngawardlevel, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardvalue
		for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thnggetn(TB_STORM_AWARD[awardtype][5]), nh薾 頲 ph莕 thngdo
			if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][i][1]), nh薾 頲 ph莕 thngthen
				if, nh薾 頲 ph莕 thng(awardlevel, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][i][1], nh薾 頲 ph莕 thngor, nh薾 頲 ph莕 thnggetn(tb_award), nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen	--不能l穘h低级奖励
					awardlevel, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngi
				end
			end
		end
		return, nh薾 頲 ph莕 thngawardvalue,, nh薾 頲 ph莕 thngtb_award
	else
		if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng<, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][awardid][1]), nh薾 頲 ph莕 thngthen
			Say("V�, nh薾 頲 ph莕 thngl﹎, nh薾 頲 ph莕 thngtruy襫, nh薾 頲 ph莕 thngnh﹏:, nh薾 頲 ph莕 thngH譶h, nh薾 頲 ph莕 thngnh�, nh薾 頲 ph莕 thngngi, nh薾 頲 ph莕 thngkh玭g, nh薾 頲 ph莕 thngth�, nh薾 頲 ph莕 thngnh薾, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngn祔!",, nh薾 頲 ph莕 thng0)
			return, nh薾 頲 ph莕 thngnil
		else
			return, nh薾 頲 ph莕 thngawardvalue
		end
	end
end

--主对话
function, nh薾 頲 ph莕 thngstorm_main()
	if, nh薾 頲 ph莕 thng(GetTask(STORM_TASKID_LETTER), nh薾 頲 ph莕 thng~=, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen
		Describe(STORM_WLMCR.."<#>, nh薾 頲 ph莕 thngKi誴, nh薾 頲 ph莕 thnggiang, nh薾 頲 ph莕 thngh�, nh薾 頲 ph莕 thngl蕐, nh薾 頲 ph莕 thngs玭g, nh薾 頲 ph莕 thngn骾, nh薾 頲 ph莕 thngl�, nh薾 頲 ph莕 thngnh�!, nh薾 頲 ph莕 thngNg萵g, nh薾 頲 ph莕 thngm苩, nh薾 頲 ph莕 thngnh譶, nh薾 頲 ph莕 thngtr╪g,, nh薾 頲 ph莕 thngcu鑙, nh薾 頲 ph莕 thngu, nh薾 頲 ph莕 thngmh譶, nh薾 頲 ph莕 thngnc!, nh薾 頲 ph莕 thngCh顃, nh薾 頲 ph莕 thngngh�, nh薾 頲 ph莕 thngn, nh薾 頲 ph莕 thngc﹗, nh薾 頲 ph莕 thngth�:, nh薾 頲 ph莕 thngV�, nh薾 頲 ph莕 thngth�, nh薾 頲 ph莕 thng阯g, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thngb籲g, nh薾 頲 ph莕 thngph糿g, nh薾 頲 ph莕 thngm穒,, nh薾 頲 ph莕 thnganh, nh薾 頲 ph莕 thngh飊g, nh薾 頲 ph莕 thngh祇, nh薾 頲 ph莕 thngki謙, nh薾 頲 ph莕 thngc�, nh薾 頲 ph莕 thngh琻, nh薾 頲 ph莕 thngai!",, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thng"B総, nh薾 頲 ph莕 thngu, nh薾 頲 ph莕 thngho箃, nh薾 頲 ph莕 thngng, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngba, nh薾 頲 ph莕 thngth竛g, nh薾 頲 ph莕 thng9/storm_main")
		Msg2Player("B筺, nh薾 頲 ph莕 thngnh薾, nh薾 頲 ph莕 thng頲, nh薾 頲 ph莕 thngb秐, nh薾 頲 ph莕 thngth秓, nh薾 頲 ph莕 thngth莕, nh薾 頲 ph莕 thngb�, nh薾 頲 ph莕 thngc馻, nh薾 頲 ph莕 thngTh萴, nh薾 頲 ph莕 thngThi謚, nh薾 頲 ph莕 thngVi詎")
		AddItem(6,, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thng898,, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thng0, nh薾 頲 ph莕 thng,0)
		SetTask(STORM_TASKID_LETTER,, nh薾 頲 ph莕 thng2)
	else
		local, nh薾 頲 ph莕 thngtb_option, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngmu鑞, nh薾 頲 ph莕 thngl穘h, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngh玬, nh薾 頲 ph莕 thngnay/#storm_award(1)"
		if, nh薾 頲 ph莕 thng(GetTask(STORM_TASKID_DAY_LASTAWARD), nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
			tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngmu鑞, nh薾 頲 ph莕 thngl穘h, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngh玬, nh薾 頲 ph莕 thngqua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngmu鑞, nh薾 頲 ph莕 thngl穘h, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngtu莕, nh薾 頲 ph莕 thngtrc/#storm_award(2)"
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngmu鑞, nh薾 頲 ph莕 thngl穘h, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngth竛g, nh薾 頲 ph莕 thngtrc/#storm_award(3)"
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"T譵, nh薾 頲 ph莕 thnghi觰, nh薾 頲 ph莕 thng甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngc馻, nh薾 頲 ph莕 thngta/#storm_query(0)"
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"T譵, nh薾 頲 ph莕 thnghi觰, nh薾 頲 ph莕 thngho箃, nh薾 頲 ph莕 thngng, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa/storm_help"
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Kh玭g, nh薾 頲 ph莕 thngc莕!/OnCancel"
		Describe(STORM_WLMCR.."<#>, nh薾 頲 ph莕 thngXin, nh薾 頲 ph莕 thngxem, nh薾 頲 ph莕 thngth玭g, nh薾 頲 ph莕 thngtin, nh薾 頲 ph莕 thngchi, nh薾 頲 ph莕 thngti誸, nh薾 頲 ph莕 thngho箃, nh薾 頲 ph莕 thngng, nh薾 頲 ph莕 thngtr猲, nh薾 頲 ph莕 thngtrang, nh薾 頲 ph莕 thngch�, nh薾 頲 ph莕 thng",, nh薾 頲 ph莕 thnggetn(tb_option),, nh薾 頲 ph莕 thngtb_option)
	end
	storm_anotherday()
end

--l穘h取奖励（查看奖励）
function, nh薾 頲 ph莕 thngstorm_award(awardtype)
	local, nh薾 頲 ph莕 thngawardvalue,, nh薾 頲 ph莕 thngtb_award, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstorm_checkaward(awardtype)
	if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
		return
	end
	
	local, nh薾 頲 ph莕 thngstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng""
	if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"B筺, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][1].."t輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa, nh薾 頲 ph莕 thngl�:"..storm_point2str(awardvalue)
	elseif, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng-12), nh薾 頲 ph莕 thngthen
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][1].."kh玭g, nh薾 頲 ph莕 thngc�, nh薾 頲 ph莕 thngtrong, nh薾 頲 ph莕 thngb秐g, nh薾 頲 ph莕 thngx誴, nh薾 頲 ph莕 thngh筺g"
	elseif, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng-11), nh薾 頲 ph莕 thngthen
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"B筺, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][1].."kh玭g, nh薾 頲 ph莕 thngc�, nh薾 頲 ph莕 thngtrong, nh薾 頲 ph莕 thngb秐g, nh薾 頲 ph莕 thngx誴, nh薾 頲 ph莕 thngh筺g"
	elseif, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng-3), nh薾 頲 ph莕 thngthen
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"B筺, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][1].."trong, nh薾 頲 ph莕 thngho箃, nh薾 頲 ph莕 thngng, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngba, nh薾 頲 ph莕 thngth竛g, nh薾 頲 ph莕 thng9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"B筺, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][1].."trong, nh薾 頲 ph莕 thngho箃, nh薾 頲 ph莕 thngng, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngba, nh薾 頲 ph莕 thngth竛g, nh薾 頲 ph莕 thng9排danh, nh薾 頲 ph莕 thng"..storm_point2str(-awardvalue).."danh, nh薾 頲 ph莕 thng"
	end
	
	local, nh薾 頲 ph莕 thngawardcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thnggetn(tb_award)
	if, nh薾 頲 ph莕 thng(awardcount, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
		local, nh薾 頲 ph莕 thngtb_option, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
		if, nh薾 頲 ph莕 thng(awardcount, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr..",, nh薾 頲 ph莕 thngB筺, nh薾 頲 ph莕 thng可以l穘h取奖品:, nh薾 頲 ph莕 thng<enter>"
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<enter>,, nh薾 頲 ph莕 thngnh薾, nh薾 頲 ph莕 thngb﹜, nh薾 頲 ph莕 thnggi�, nh薾 頲 ph莕 thngch�?"
			Say("V�, nh薾 頲 ph莕 thngl﹎, nh薾 頲 ph莕 thngtruy襫, nh薾 頲 ph莕 thngnh﹏:"..str,, nh薾 頲 ph莕 thng2,, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngmu鑞, nh薾 頲 ph莕 thngnh薾, nh薾 頲 ph莕 thngph莕, nh薾 頲 ph莕 thngthng/#storm_getaward("..awardtype..","..tb_award[1]..",0)",, nh薾 頲 ph莕 thng"в, nh薾 頲 ph莕 thngta, nh薾 頲 ph莕 thngsuy, nh薾 頲 ph莕 thngngh�, nh薾 頲 ph莕 thngl筰/OnCancel")
		else
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr..",, nh薾 頲 ph莕 thngB筺, nh薾 頲 ph莕 thng可以T筰以下奖苝h髏腥窝∫桓�:, nh薾 頲 ph莕 thng<enter>"
			for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thnggetn(tb_award), nh薾 頲 ph莕 thngdo
				if, nh薾 頲 ph莕 thng(i, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen
					str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."ho芻, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng"
				end
				local, nh薾 頲 ph莕 thngawardname, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"l穘h"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<enter>, nh薾 頲 ph莕 thngQuy誸, nh薾 頲 ph莕 thngnh, nh薾 頲 ph莕 thngxong, nh薾 頲 ph莕 thngch璦?"
			tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Kh玭g, nh薾 頲 ph莕 thngc莕!/OnCancel"
			Say("V�, nh薾 頲 ph莕 thngl﹎, nh薾 頲 ph莕 thngtruy襫, nh薾 頲 ph莕 thngnh﹏:"..str,, nh薾 頲 ph莕 thnggetn(tb_option),, nh薾 頲 ph莕 thngtb_option)
		end
	else
		Say("V�, nh薾 頲 ph莕 thngl﹎, nh薾 頲 ph莕 thngtruy襫, nh薾 頲 ph莕 thngnh﹏:"..str..",, nh薾 頲 ph莕 thngB筺, nh薾 頲 ph莕 thng无法l穘h奖",, nh薾 頲 ph莕 thng0)
		return
	end
end

--l穘h取指定奖品
function, nh薾 頲 ph莕 thngstorm_getaward(awardtype,, nh薾 頲 ph莕 thngawardid,, nh薾 頲 ph莕 thngsure)
	local, nh薾 頲 ph莕 thngawardvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstorm_checkaward(awardtype,, nh薾 頲 ph莕 thngawardid)
	if, nh薾 頲 ph莕 thng(not, nh薾 頲 ph莕 thngstorm_checkaward(awardtype,, nh薾 頲 ph莕 thngawardid)), nh薾 頲 ph莕 thngthen
		return
	end

	if, nh薾 頲 ph莕 thng(sure, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen
		Say("l穘h奖前整理背包!",, nh薾 頲 ph莕 thng2,, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thngs絥, nh薾 頲 ph莕 thngs祅g!/#storm_getaward("..awardtype..","..awardid..",2)",, nh薾 頲 ph莕 thng"Ta, nh薾 頲 ph莕 thngc遪, nh薾 頲 ph莕 thngph秈, nh薾 頲 ph莕 thngs緋, nh薾 頲 ph莕 thngx誴, nh薾 頲 ph莕 thngl筰, nh薾 頲 ph莕 thngh祅h, nh薾 頲 ph莕 thngtrang/OnCancel")
	elseif, nh薾 頲 ph莕 thng(sure, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen
		if, nh薾 頲 ph莕 thng(CalcFreeItemCellCount(), nh薾 頲 ph莕 thng<, nh薾 頲 ph莕 thngstorm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])), nh薾 頲 ph莕 thngthen
			Say("B筺, nh薾 頲 ph莕 thng的背包没有空间，整理一下!",, nh薾 頲 ph莕 thng0)
		else
			if, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1, nh薾 頲 ph莕 thngor, nh薾 頲 ph莕 thngawardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng4), nh薾 頲 ph莕 thngthen
				local, nh薾 頲 ph莕 thngmapid, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngtostring(SubWorldIdx2ID(SubWorld))
				local, nh薾 頲 ph莕 thngplcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngGetGlbValue(46), nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thng1
				SetGlbValue(46,, nh薾 頲 ph莕 thngplcount)
				Ladder_NewLadder(10195,, nh薾 頲 ph莕 thngmapid,, nh薾 頲 ph莕 thngplcount,, nh薾 頲 ph莕 thng1)
			end
			local, nh薾 頲 ph莕 thngstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Nh薾, nh薾 頲 ph莕 thng頲"..TB_STORM_AWARD[awardtype][1].."Ph莕, nh薾 頲 ph莕 thngthng, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa, nh薾 頲 ph莕 thng"..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3],, nh薾 頲 ph莕 thng1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
				str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardvalue.."甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa"
			else
				str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"X誴, nh薾 頲 ph莕 thngh筺g, nh薾 頲 ph莕 thngth�, nh薾 頲 ph莕 thng"..(-awardvalue).."danh, nh薾 頲 ph莕 thng"
			end
			if, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2, nh薾 頲 ph莕 thngor, nh薾 頲 ph莕 thngawardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng3, nh薾 頲 ph莕 thngor, nh薾 頲 ph莕 thngawardid, nh薾 頲 ph莕 thng<=, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen	--大奖发布公告
				AddGlobalNews(GetName().."T筰"..TB_STORM_AWARD[awardtype][1].."风暴活动中Nh薾, nh薾 頲 ph莕 thng頲"..TB_STORM_AWARD[awardtype][5][awardid][2]..", nh薾 頲 ph莕 thng")
			end
		end
	else
		Say("B筺, nh薾 頲 ph莕 thng确定l穘h取<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color>, nh薾 頲 ph莕 thng是吗?, nh薾 頲 ph莕 thngl穘h完之后不能l穘h了"..TB_STORM_AWARD[awardtype][1].."ph莕 thng kh竎 n鱝!",, nh薾 頲 ph莕 thng2,, nh薾 頲 ph莕 thng"知道了!, nh薾 頲 ph莕 thng我只l穘h这个算了！/#storm_getaward("..awardtype..","..awardid..",1)",, nh薾 頲 ph莕 thng"Kh玭g, nh薾 頲 ph莕 thngc莕!/OnCancel")
	end
end

--查询个人甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa情况
function, nh薾 頲 ph莕 thngstorm_query(querytype)
	storm_anotherday()
	
	local, nh薾 頲 ph莕 thngstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng""
	local, nh薾 頲 ph莕 thngtb_sheet, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
	local, nh薾 頲 ph莕 thngvar_width,, nh薾 頲 ph莕 thngvar_align
	if, nh薾 頲 ph莕 thng(querytype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen
		if, nh薾 頲 ph莕 thng(GetTask(STORM_TASKID_DAY), nh薾 頲 ph莕 thng<=, nh薾 頲 ph莕 thngSTORM_END_DAY), nh薾 頲 ph莕 thngthen
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"B筺, nh薾 頲 ph莕 thng今nh藅 的甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa如下:, nh薾 頲 ph莕 thng<enter>%今nh藅 总积ph髏是:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{12,8,8,10}
			var_align, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng2
			tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{"活动danh, nh薾 頲 ph莕 thng",, nh薾 頲 ph莕 thng"S� l莕",, nh薾 頲 ph莕 thng"Tr筺g th竔 ",, nh薾 頲 ph莕 thng"觤 t輈h l騳 cao nh蕋"}
			for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thngSTORM_GAMEID_MAX, nh薾 頲 ph莕 thngdo
				if, nh薾 頲 ph莕 thng(TB_STORM_TASKID[i], nh薾 頲 ph莕 thng~=, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
					local, nh薾 頲 ph莕 thngtrycount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngGetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local, nh薾 頲 ph莕 thngstate, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng""
					if, nh薾 頲 ph莕 thngstorm_valid_game(i), nh薾 頲 ph莕 thngthen
						state, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"<color=red>正T筰进行<color>"
					elseif, nh薾 頲 ph莕 thng(trycount, nh薾 頲 ph莕 thng<=, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
						state, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"<color=blue>Ch璦 ti課 h祅h<color>"
					elseif, nh薾 頲 ph莕 thng(trycount, nh薾 頲 ph莕 thng<, nh薾 頲 ph莕 thngTB_STORM_TRYTIMES[i]), nh薾 頲 ph莕 thngthen
						state, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"<color=green>Х ti課 h祅h<color>"
					else
						state, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"<color=8947848>Х k誸 th骳<color>"
					end
					tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"ho箃 ng <color=red>Phong ba th竛g 9<color>  k誸 th骳!"
		end
	elseif, nh薾 頲 ph莕 thng(querytype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng", nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thngB筺, nh薾 頲 ph莕 thng最近的t輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa, nh薾 頲 ph莕 thngl�:<enter>%s"
		var_width, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{8,10,6,8,10}
		var_align, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng2
		tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{
			"觤 t輈h l騳 h玬 nay",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_DAY_POINT)),, nh薾 頲 ph莕 thng"",
			"觤 t輈h l騳 h玬 qua",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{
			"觤 t輈h l騳 tu莕 n祔",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_WEEK_POINT)),, nh薾 頲 ph莕 thng"",
			"觤 t輈h l騳 tu莕 trc",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{
			"觤 t輈h l騳 th竛g n祔",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_MONTH_POINT)),, nh薾 頲 ph莕 thng"",
			"觤 t輈h l騳 th竛g trc",, nh薾 頲 ph莕 thngstorm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{
			"上Tu莕排danh, nh薾 頲 ph莕 thng",, nh薾 頲 ph莕 thng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>",, nh薾 頲 ph莕 thng"",
			"上nguy謙 排danh, nh薾 頲 ph莕 thng",, nh薾 頲 ph莕 thng"<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("B筺, nh薾 頲 ph莕 thng想了解什么问题?",, nh薾 頲 ph莕 thng3,, nh薾 頲 ph莕 thng"我今天的甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa/#storm_query(1)",, nh薾 頲 ph莕 thng"我最近的甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa/#storm_query(2)",, nh薾 頲 ph莕 thng"Kh玭g c� chuy謓 g� u!/OnCancel")
		return
	end
	str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngformat(str,, nh薾 頲 ph莕 thngmaketable(tb_sheet,, nh薾 頲 ph莕 thngvar_width,, nh薾 頲 ph莕 thngvar_align))
	Say(str,, nh薾 頲 ph莕 thng2,, nh薾 頲 ph莕 thng"Ti誴 t鬰 t譵 hi觰/#storm_query(0)",, nh薾 頲 ph莕 thng"Kh玭g c� g�, c竚 琻!/OnCancel")
end

--活动说明——总
function, nh薾 頲 ph莕 thngstorm_help()
	local, nh薾 頲 ph莕 thngtb_option, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
	for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thngSTORM_GAMEID_MAX, nh薾 頲 ph莕 thngdo
		if, nh薾 頲 ph莕 thng(TB_STORM_TASKID[i], nh薾 頲 ph莕 thng~=, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
			tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Li猲 quan ho箃 ng Phong Ba-"..TB_STORM_DESCRIBE[i].."gi髉 /#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Li猲 quan ph莕 thng ho箃 ng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Ta bi誸 r錳!/OnCancel"
	Say(", nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng风暴活动从8/9/n2/10,, nh薾 頲 ph莕 thng包括宋金战场,, nh薾 頲 ph莕 thng野叟任务链,, nh薾 頲 ph莕 thng杀手试炼任务., nh薾 頲 ph莕 thng每天将会根据系统中的成绩给出<color=yellow>甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa<color>, nh薾 頲 ph莕 thng(参加条件:, nh薾 頲 ph莕 thng50级以上玩家), nh薾 頲 ph莕 thng.每nh藅 m蕐ph髏将T筰<color=red>24:00之后清零<color>,, nh薾 頲 ph莕 thng请T筰24:00前l穘h奖.<enter>., nh薾 頲 ph莕 thng每天, nh薾 頲 ph莕 thng<color=red>23:30<color>, nh薾 頲 ph莕 thng宋金战场开始,, nh薾 頲 ph莕 thng成绩不记录进甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa.",, nh薾 頲 ph莕 thnggetn(tb_option),, nh薾 頲 ph莕 thngtb_option)
end

--活动说明——挑战
function, nh薾 頲 ph莕 thngstorm_help_game(gameid)
	local, nh薾 頲 ph莕 thngstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngTB_STORM_HELP[gameid]
	if, nh薾 頲 ph莕 thng(gameid, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen	--宋金需要补充说明ph髏数上限
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngformat(str,, nh薾 頲 ph莕 thng"高级宋金战场,, nh薾 頲 ph莕 thng每人每天最多只能l穘h取的甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa是<color=yellow>100<color>, nh薾 頲 ph莕 thng点., nh薾 頲 ph莕 thng初中级宋金战场最多ph髏别Nh薾, nh薾 頲 ph莕 thng頲<color=yellow>80<color>,, nh薾 頲 ph莕 thng<color=yellow>90<color>, nh薾 頲 ph莕 thng点.")
	end
	Say(str,, nh薾 頲 ph莕 thng2,, nh薾 頲 ph莕 thng"Mu鑞 t譵 hi觰 nh鱪g th� kh竎/storm_help",, nh薾 頲 ph莕 thng"Ta bi誸 r錳!/OnCancel")
end

--活动说明——奖励
function, nh薾 頲 ph莕 thngstorm_help_award(awardtype,start)
	if, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
		Say(", nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng每天玩家可以n武林传人处,, nh薾 頲 ph莕 thng根据<color=red>甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa<color>, nh薾 頲 ph莕 thng可以l穘h取相应的奖励,, nh薾 頲 ph莕 thng同时，每Tu莕，每nguy謙 都有相应的甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa排行<color=red>排danh, nh薾 頲 ph莕 thng前十<color>可以T筰当nguy謙 的第二个星期n武林传人处l穘h奖",, nh薾 頲 ph莕 thng4,
			"Xem ph莕 thng ng祔/#storm_help_award(1)",
			"Xem ph莕 thng tu莕/#storm_help_award(2)",
			"Xem ph莕 thng th竛g/#storm_help_award(3)",
			"Ta bi誸 r錳!/OnCancel")
		return
	end
	
	local, nh薾 頲 ph莕 thngtb_awardstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{"nh藅 ",, nh薾 頲 ph莕 thng"Tu莕",, nh薾 頲 ph莕 thng"nguy謙 "}
	local, nh薾 頲 ph莕 thngstr, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"甶觤, nh薾 頲 ph莕 thngt輈h, nh薾 頲 ph莕 thngl騳, nh薾 頲 ph莕 thngPhong, nh薾 頲 ph莕 thngBa"..tb_awardstr[awardtype].."Ph莕 thng nh� sau:"
	if, nh薾 頲 ph莕 thng(not, nh薾 頲 ph莕 thngstart), nh薾 頲 ph莕 thngthen
		start, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1
	end
	local, nh薾 頲 ph莕 thnglastvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngnil
	local, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng0
	local, nh薾 頲 ph莕 thngPERPAGE, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng4
	for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstart,, nh薾 頲 ph莕 thnggetn(TB_STORM_AWARD[awardtype][5]), nh薾 頲 ph莕 thngdo
		if, nh薾 頲 ph莕 thng(count, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thngPERPAGE), nh薾 頲 ph莕 thngthen	--PERPAGE项一页
			break
		end
		count, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thng1
		
		local, nh薾 頲 ph莕 thngawardvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngTB_STORM_AWARD[awardtype][5][i][1]
		if, nh薾 頲 ph莕 thng(lastvalue, nh薾 頲 ph莕 thng~=, nh薾 頲 ph莕 thngawardvalue), nh薾 頲 ph莕 thngthen
			if, nh薾 頲 ph莕 thng(awardvalue, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngthen
				str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<enter>".."T輈h l騳"..storm_point2str(awardvalue,3).."ph髏"
			else
				if, nh薾 頲 ph莕 thng(lastvalue), nh薾 頲 ph莕 thngthen
					str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<enter>"..tb_awardstr[awardtype].."排T筰第"..storm_point2str(1-lastvalue).."n"..storm_point2str(-awardvalue).."m蕐"
				else
					str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<enter>"..tb_awardstr[awardtype].."排T筰第"..storm_point2str(-awardvalue).."m蕐"
				end
			end
			lastvalue, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardvalue
		else
			str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."ho芻, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng, nh薾 頲 ph莕 thng"
		end
		str, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngstr.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local, nh薾 頲 ph莕 thngtb_option, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng{}
	if, nh薾 頲 ph莕 thng(start, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Trang trc/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if, nh薾 頲 ph莕 thng(start, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng<, nh薾 頲 ph莕 thnggetn(TB_STORM_AWARD[awardtype][5])), nh薾 頲 ph莕 thngthen
		tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"Trang k� /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"想Mu鑞 t譵 hi觰 nh鱪g th� kh竎/storm_help"
	tb_option[getn(tb_option)+1], nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng"我Ta bi誸 r錳!/OnCancel"
	Say(str,, nh薾 頲 ph莕 thnggetn(tb_option),, nh薾 頲 ph莕 thngtb_option)
end

--Nh薾, nh薾 頲 ph莕 thng頲该玩家T筰指定排行中的danh, nh薾 頲 ph莕 thng次
function, nh薾 頲 ph莕 thngstorm_getrank(laddertype)
	local, nh薾 頲 ph莕 thngladderid, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngnil
	if, nh薾 頲 ph莕 thng(laddertype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen	--nh藅 排行，暂无
		return, nh薾 頲 ph莕 thng12
	elseif, nh薾 頲 ph莕 thng(laddertype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen	--Tu莕排行
		local, nh薾 頲 ph莕 thngweekid, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngGetTask(STORM_TASKID_WEEK), nh薾 頲 ph莕 thng-, nh薾 頲 ph莕 thngSTORM_LADDER_WEEK
		if(weekid, nh薾 頲 ph莕 thng>=, nh薾 頲 ph莕 thng1, nh薾 頲 ph莕 thngand, nh薾 頲 ph莕 thngweekid, nh薾 頲 ph莕 thng<=, nh薾 頲 ph莕 thng4), nh薾 頲 ph莕 thngthen, nh薾 頲 ph莕 thng	--只有2、3、4、5Tu莕有上Tu莕
			ladderid, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngSTORM_LADDERID_WEEK1, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thngweekid, nh薾 頲 ph莕 thng-, nh薾 頲 ph莕 thng1
		end
	elseif, nh薾 頲 ph莕 thng(laddertype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng3), nh薾 頲 ph莕 thngthen	--nguy謙 排行
		if, nh薾 頲 ph莕 thng(GetTask(STORM_TASKID_MONTH), nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng10), nh薾 頲 ph莕 thngthen	--只有10nguy謙 有上Tu莕
			ladderid, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngSTORM_LADDERID_MONTH
		end
	else
		return, nh薾 頲 ph莕 thng12
	end
	
	if, nh薾 頲 ph莕 thng(ladderid, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
		return, nh薾 頲 ph莕 thng12
	end
	
	local, nh薾 頲 ph莕 thngplayername, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngGetName()
	for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thng10, nh薾 頲 ph莕 thngdo
		if, nh薾 頲 ph莕 thng(playername, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngLadder_GetLadderInfo(ladderid,, nh薾 頲 ph莕 thngi)), nh薾 頲 ph莕 thngthen
			return, nh薾 頲 ph莕 thngi
		end
	end
	return, nh薾 頲 ph莕 thng11
end

--可升级的加经验
function, nh薾 頲 ph莕 thngstorm_addownexp(, nh薾 頲 ph莕 thngawardexp, nh薾 頲 ph莕 thng)
	tl_addPlayerExp(awardexp)
end

--给与全部奖励
function, nh薾 頲 ph莕 thngstorm_giveallaward(tb_awards)
	for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thnggetn(tb_awards), nh薾 頲 ph莕 thngdo
		storm_giveoneaward(tb_awards[i])
	end
end

--给与一个奖励
function, nh薾 頲 ph莕 thngstorm_giveoneaward(tb_award)
	local, nh薾 頲 ph莕 thngawardtype, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngtb_award[1]
	local, nh薾 頲 ph莕 thngawardcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngtb_award[3]
	if, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen	--普通物品
		while, nh薾 頲 ph莕 thng(awardcount, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardcount, nh薾 頲 ph莕 thng-, nh薾 頲 ph莕 thng1
		end
	elseif, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen	--黄金物品
		while, nh薾 頲 ph莕 thng(awardcount, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngdo
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardcount, nh薾 頲 ph莕 thng-, nh薾 頲 ph莕 thng1
		end
	elseif, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng3), nh薾 頲 ph莕 thngthen	--非物品
		if, nh薾 頲 ph莕 thng(tb_award[2], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen	--经验
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--留作扩展
			WriteLog("storm_giveoneaward, nh薾 頲 ph莕 thng:, nh薾 頲 ph莕 thngerror, nh薾 頲 ph莕 thngtb_award[2]")
		end
	elseif, nh薾 頲 ph莕 thng(awardtype, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng4), nh薾 頲 ph莕 thngthen	--随机物品
		while, nh薾 頲 ph莕 thng(awardcount, nh薾 頲 ph莕 thng>, nh薾 頲 ph莕 thng0), nh薾 頲 ph莕 thngdo
			local, nh薾 頲 ph莕 thnggiveindex, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngrandom(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngawardcount, nh薾 頲 ph莕 thng-, nh薾 頲 ph莕 thng1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward, nh薾 頲 ph莕 thng:, nh薾 頲 ph莕 thngerror, nh薾 頲 ph莕 thngawardtype")
	end
end

--估算全部奖励物品数量
function, nh薾 頲 ph莕 thngstorm_countallaward(tb_awards)
	local, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng0
	for, nh薾 頲 ph莕 thngi, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1,, nh薾 頲 ph莕 thnggetn(tb_awards), nh薾 頲 ph莕 thngdo
		if, nh薾 頲 ph莕 thng(tb_awards[i][1], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng1), nh薾 頲 ph莕 thngthen	--普通物品
			count, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thngtb_awards[i][3]
		elseif, nh薾 頲 ph莕 thng(tb_awards[i][1], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng2), nh薾 頲 ph莕 thngthen	--黄金物品
			count, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thngtb_awards[i][3]*2
		elseif, nh薾 頲 ph莕 thng(tb_awards[i][1], nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thng4), nh薾 頲 ph莕 thngthen	--随机物品
			count, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thngcount, nh薾 頲 ph莕 thng+, nh薾 頲 ph莕 thngtb_awards[i][3]*2
		end
	end
	return, nh薾 頲 ph莕 thngcount
end

--将数组拆开
function, nh薾 頲 ph莕 thngstorm_splittb(tb,, nh薾 頲 ph莕 thngn)
	if, nh薾 頲 ph莕 thng(n, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thngnil), nh薾 頲 ph莕 thngthen
		n, nh薾 頲 ph莕 thng=, nh薾 頲 ph莕 thng1
	end
	if, nh薾 頲 ph莕 thng(n, nh薾 頲 ph莕 thng==, nh薾 頲 ph莕 thnggetn(tb)), nh薾 頲 ph莕 thngthen
		return, nh薾 頲 ph莕 thngtb[n]
	end
	return, nh薾 頲 ph莕 thngtb[n],, nh薾 頲 ph莕 thngstorm_splittb(tb,n+1)
end
