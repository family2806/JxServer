--by 廖志山 [2006-09-12]
--2006中秋活动之增加孩童NPC
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_AUTO_06__) then
	__H_MIDAUTUMN_AUTO_06__ = 1;
	
-- Include("\\script\\event\\mid_autumn06\\head.lua");	by 子非魚 2009-06-01 过期删除
-- AU06_KIDNPCSCRIPT = "\\script\\event\\funv_jieri\\200803\\meirenxianhua.lua";	by 子非魚 2009-06-01 过期删除

AU06_KIDNPCSCRIPT = "\\script\\event\\birthday_jieri\\200905\\npc\\npc_zhanxin_zunzhe.lua";

au06_tab_kidnpc = {
	{665,	20,		3545,	6196,	AU06_KIDNPCSCRIPT,	"战心尊者"}, --江津
	{665,	53,		1622,	3193,	AU06_KIDNPCSCRIPT,	"战心尊者"}, --巴陵
	{665,	101,	1673,	3179,	AU06_KIDNPCSCRIPT,	"战心尊者"},--稻香村
	{665,	174,	1628,	3209,	AU06_KIDNPCSCRIPT,	"战心尊者"},--龙泉村
	{665,	121,	1950,	4516,	AU06_KIDNPCSCRIPT,	"战心尊者"},--龙门镇
	{665,	99,		1610,	3183,	AU06_KIDNPCSCRIPT,	"战心尊者"},--永乐镇
	{665,	100,	1628,	3188,	AU06_KIDNPCSCRIPT,	"战心尊者"},--朱仙镇
	{665,	153,	1603,	3234,	AU06_KIDNPCSCRIPT,	"战心尊者"},--石鼓镇
}


end;	--//end of __H_MIDAUTUMN_AUTO_06__