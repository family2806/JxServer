

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function zhongqiu0808_zhangonghuizhang(nBattleLevel, i)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	local tbItem = 	{szName="ս��ѫ��", tbProp={6, 1, 1818, 1, 0, 0}}
	if nDate >= zhongqiu0808_ZhanGongStartTime and nDate <= zhongqiu0808_ZhanGongEndTime then
		if zhongqiu0808_PlayerLimit() == 1 and nBattleLevel == 3  then
			if BT_GetData(PL_CURRANK) == 5 then
				Msg2Player("�ʹ���һ��ս��ѫ�£���Ϊ�ɼ���ɫ!")
				tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
			else
				Msg2Player("ս��ѫ��ֻ���͸��ﵽ�󽫳ƺŵ���ң��´θ�Ŭ����Ŷ!")
			end
		end
	end
	
	
	
end

function zhongqiu0808_gongxuanlingpai()
	local tbSay = 
	{
		"<dec><npc>��2000�ν���ֻ�ȡ1����״����.",
		"ȷ��/zhongqiu0808_gongxuanlingpai_ok",
		"����/no"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_gongxuanlingpai_ok()
	if GetLevel() < 120 or IsCharged() ~= 1 then 
		return Say("ֻ��120�����ѳ�ֵ������ܻ���״����.", 0)
	end
	
	local tbItem = 	{szName="��״����", tbProp={6, 1, 1819, 1, 0, 0}}
	local nPoint = 2000
	if nt_getTask(747) < nPoint then
		Say(format("�i���Ļ��ֲ����� %d, ���ܻ�ȡ��״����.", nPoint),0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - nPoint));
	tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
end