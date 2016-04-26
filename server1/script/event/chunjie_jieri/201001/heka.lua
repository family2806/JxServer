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
	"��������", 
	"���ֲ���", 
	"��Դ����", 
	"��������",
	"��������", 
	"���´�", 
	"�ɸ�ӭ��",
	"������С��, ֻ�����˾���, �κ�ʱ������",
	"���ﲻ����ȫ�ұ���",
	"�����㹻�����˷���",
	"��Ů����, ����һ��",
	"Ǯ������, �������",
	"����, ����, �ε���ס����",
	"����, �ֹ�, ��Ĭ��������",
	"��ù, ʹ��Զ����",
	"����������, �������",
	"����֮��, ���밮��",
	"���������Ѳ���������С��",
}

TSK_HECA_COUNT = TaskManager:GetTaskId(1, 8);

function main()

	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100322) then
		Msg2Player("����Ʒ�ѹ���.");
		return 0;
	end
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		lib:ShowMessage("δ�ﵽ�������!");
		return 1;
	end
	
	for i=1,nTeamSize do
		local nLv = doFunByPlayer(GetTeamMember(i), GetLevel);
		local nExPoint = doFunByPlayer(GetTeamMember(i), GetExtPoint, 0);
		
		if (nLv < 50 or nExPoint < 1) then
			lib:ShowMessage(format("%s%s","������ӳ�Ա��Ҫ��", format(" <color=green>%d<color> �����ϲ����ѳ�ֵ�ſ��� %s",50,"ʹ��")));
			return 1;
		end
	end
	
	for i=1,nTeamSize do
		local nIdx = GetTeamMember(i);
		
		if (doFunByPlayer(nIdx, PlayerFunLib.CheckTask, PlayerFunLib,TSK_HECA_COUNT,"6000",format("ͨ��ʹ�� [%s] ���ֻ���� %s ����","ף����","<color=green>600000000<color=green>"),"<") == 1) then
			doFunByPlayer(nIdx, PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s ����","ף����"));
			doFunByPlayer(nIdx, PlayerFunLib.AddTask, PlayerFunLib, TSK_HECA_COUNT, 50);
		end
		
		if (nIdx ~= PlayerIndex) then
			local szMsg = format("<color=yellow>%s <color> ף<color=yellow>%s<color> <color=%s>%s<color>",GetName(), doFunByPlayer(nIdx, GetName), tbColor[random(1,getn(tbColor))], tbBless[random(1,getn(tbBless))]);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg , "", "");
		end
	end

	return 0;
end