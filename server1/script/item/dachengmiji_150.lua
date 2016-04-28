-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ» 150¼¶´ó³ËÃØ¼®
-- ÓÒ¼üµã»÷Ê¹ÓÃ£¬¿ÉÌáÉı150¼¶ÊìÁ·¶È¼¼ÄÜµ½20¼¶¡£

-- Edited by ×Ó·Çô~
-- 2010/06/29 15:21

-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "Gièng nh­ quyÓn s¸ch nµy miªu t¶ chİnh lµ c¸c m«n ph¸i cao cÊp vâ c«ng , ng­¬i kh«ng biÕt bän hä huyÒn c¬ ");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 20) then
			tinsert(tb_Desc, format("Th¨ng cÊp ".."%s/upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "Kü n¨ng ®¹t tíi cao cÊp nhÊt hoÆc lµ cßn ch­a häc .");
		return 1;
	end
	
	tinsert(tb_Desc, 1, " lùa chän cÇn th¨ng cÊp ®İch kü n¨ng :");
	tinsert(tb_Desc, "KÕt thóc ®èi tho¹i /OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 20) then
		return	
	end
	
	if (ConsumeItem(3, 1, 6, 1, 3562, -1) == 1) then
		AddMagic(n_skillid, 20);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				" ®¹i thµnh bİ tŞch 150", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
