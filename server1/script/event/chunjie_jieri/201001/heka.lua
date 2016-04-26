Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\misc\\taskmanager.lua");
IncludeLib("LEAGUE")

tbColor = 
{
	"green", 
	"cyan", 
	"pink", 
	"violet", 
	"orange", 
	"gold", 
	"white",
}

tbBless = 
{
	"安康兴旺", 
	"欢乐不断", 
	"财源滚滚", 
	"寿与天齐",
	"万事如意", 
	"百事大吉", 
	"纳福迎祥",
	"不再有小人, 只有正人君子, 任何时候都幸运",
	"礼物不尽，全家饱足",
	"金银足够，主人发财",
	"男女老少, 欢聚一堂",
	"钱多如糖, 情坚若胶",
	"自信, 坚韧, 肝胆入住你心",
	"决断, 乐观, 幽默常伴左右",
	"倒霉, 痛苦远离你",
	"有宇宙情商, 大洋情感",
	"爱情之歌, 理想爱人",
	"建立安乐窝并有听话的小孩",
}

TSK_HECA_COUNT = TaskManager:GetTaskId(1, 8);

function main()

	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100322) then
		Msg2Player("此物品已过期.");
		return 0;
	end
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		lib:ShowMessage("未达到组队条件!");
		return 1;
	end
	
	for i=1,nTeamSize do
		local nLv = doFunByPlayer(GetTeamMember(i), GetLevel);
		local nExPoint = doFunByPlayer(GetTeamMember(i), GetExtPoint, 0);
		
		if (nLv < 50 or nExPoint < 1) then
			lib:ShowMessage(format("%s%s","所有组队成员都要是", format(" <color=green>%d<color> 级以上并且已充值才可以 %s",50,"使用")));
			return 1;
		end
	end
	
	for i=1,nTeamSize do
		local nIdx = GetTeamMember(i);
		
		if (doFunByPlayer(nIdx, PlayerFunLib.CheckTask, PlayerFunLib,TSK_HECA_COUNT,"6000",format("通过使用 [%s] 最多只可以 %s 经验","祝春帖","<color=green>600000000<color=green>"),"<") == 1) then
			doFunByPlayer(nIdx, PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s 奖励","祝春帖"));
			doFunByPlayer(nIdx, PlayerFunLib.AddTask, PlayerFunLib, TSK_HECA_COUNT, 50);
		end
		
		if (nIdx ~= PlayerIndex) then
			local szMsg = format("<color=yellow>%s <color> 祝<color=yellow>%s<color> <color=%s>%s<color>",GetName(), doFunByPlayer(nIdx, GetName), tbColor[random(1,getn(tbColor))], tbBless[random(1,getn(tbBless))]);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg , "", "");
		end
	end

	return 0;
end