
IncludeLib("BATTLE");
Include("\\script\\item\\battles\\songjinskill.lua");

egg_tbAward	=
{
	{szName = "金之战魂", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "木之战魂", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "水之战魂", 	nRate = 0.05, tbSkill = {add466, add469}},
	{szName = "火之战魂", 	nRate = 0.05, tbSkill = {add466, add468}},
	{szName = "土之护甲", 	nRate = 0.05, tbSkill = {add466, add467}},
	{szName = "金之护甲", 	nRate = 0.05, tbSkill = {add474}},
	{szName = "木之护甲", 	nRate = 0.05, tbSkill = {add477}},
	{szName = "水之护甲", 	nRate = 0.05, tbSkill = {add476}},
	{szName = "火之护甲", 	nRate = 0.05, tbSkill = {add473}},
	{szName = "土之护甲", 	nRate = 0.05, tbSkill = {add475}},
	{szName = "金之利刃", 	nRate = 0.05, tbSkill = {add479, add487, add487_1}},	-- ???
	{szName = "木之利刃", 	nRate = 0.05, tbSkill = {add480, add485}},
	{szName = "水之利刃", 	nRate = 0.05, tbSkill = {add481, add486}},
	{szName = "火之利刃", 	nRate = 0.05, tbSkill = {add482}},
	{szName = "土之利刃", 	nRate = 0.05, tbSkill = {add483}},
	{szName = "五花露", 	nRate = 0.05, tbSkill = {add472_1, add472_2, add490_1}},
	{szName = "后羿之眼", 	nRate = 0.05, tbSkill = {add495}},
	{szName = "白驹护腕", 	nRate = 0.05, tbSkill = {add496}},
	{szName = "疾风靴", 	nRate = 0.05, tbSkill = {add493}},
	{szName = "神秘物品", 	nRate = 0.05, tbSkill = {add466, add469, add468, add467, add474, add476, add477, add473, add475, add479, 
			add487, add487_1, add480, add485, add481, add486, add472_1, add472_2, add482, add483, add490_1, add493, add495, add496}},
}
egg_nTotalRate	= 100;

function main(nItemIndex)	
	local nRate		= random(egg_nTotalRate);
	local nNowRate	= 0;
	for i = 1, getn(egg_tbAward) do
		nNowRate = nNowRate + floor(egg_tbAward[i].nRate * egg_nTotalRate);
		if (nRate <= nNowRate) then
			egg_addskill(i);
			break;
		end
	end
end

function egg_addskill(nIndex)
	local nRate	= random(getn(egg_tbAward[nIndex].tbSkill));
	Msg2Player(format("恭喜你遇到<color=yellow>%s<color>", egg_tbAward[nIndex].szName));
	egg_tbAward[nIndex].tbSkill[nRate]();
	
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\tAward:%s \tProbability:%d",
				"幸运五彩蛋",
				GetLocalDate("%y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName(),
				egg_tbAward[nIndex].szName,
				egg_tbAward[nIndex].nRate));
end