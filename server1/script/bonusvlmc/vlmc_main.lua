Include("\\script\\bonusvlmc\\func_check.lua");

function AcceptEXPBonusTK()
	SetGlbValue(GlbVar1, 1)
	SetTask(TSK_Active_TK, 1)
	AddGlobalNews("V?L�m Minh Ch?<color=yellow> "..VLMC_Name.." <color> ��������Ӣ�ۺ���վ������ͬ�������. ˭�а�������ģ��Ͻ�������̨������ȡ��ս˫�����ֽ��� !")
	Msg2Player("��������<color=yellow> "..VLMC_Name.." <color> �䷢��ս˫�����ֽ���!")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC�����ν�˫��EXP")
end

function AcceptActiveX2EXP()
	SetGlbValue(GlbVar2, 1)
	SetTask(TSK_Active_x2EXP, 1)
	AddGlobalNews("��������<color=yellow> "..VLMC_Name.." <color> �䷢���˫�����ֽ��������λӢ�ۺ��ܸϽ�������̨�����콱")
	Msg2Player("V?L�m Minh Ch?<color=yellow> "..VLMC_Name.." <color> �䷢���˫�����ֽ���")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC ��������ȡ˫������")
end

function GetEXPBonus()
	SetTask(TSK_GetBonusEXP, 1)
	AddSkillState(451, 20, 1, 18*60*180);
	Say("��ϲ�����յ�˫������Ч��!");
	Msg2Player("���ѻ��60������˫������Ч��.");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."��ȡ˫������")
end

function Get2xExpTK()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	SetTask(TSK_Get2ExpTK, nDate)
	Say("��ϲ��������ν�ս��˫������!");
	Msg2Player("������ν�ս����21h00ս˫������Ч��");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."��ȡ21h00�ν�˫������")
end

function ResetGlbValue()
	SetGlbValue(1252,0)
	SetGlbValue(1253,0)
end