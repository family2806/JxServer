Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={nExp_tl=1,nRate = 50.0,nCount = 40000,},
	[2]={nExp_tl=1,nRate = 14.0,nCount = 80000,},
	[3]={nExp_tl=1,nRate = 5.0,nCount = 150000,},
	[4]={nExp_tl=1,nRate = 1.0,nCount = 300000,},
	[5]={szName="������",tbProp={6,1,2794,1,0,0},nRate = 5.0,},
	[6]={szName="��ѣ����",tbProp={6,1,2795,1,0,0},nRate = 5.0,},
	[7]={szName="��������",tbProp={6,1,2796,1,0,0},nRate = 5.0,},
	[8]={szName="������",tbProp={6,1,2797,1,0,0},nRate = 5.0,},
	[9]={szName="������",tbProp={6,1,2798,1,0,0},nRate = 5.0,},
	[10]={szName="�ܵط�",tbProp={6,1,2799,1,0,0},nRate = 5.0,},	
}

function main()
	local nNpcIndex = GetLastDiagNpc()
	if (GetNpcParam(nNpcIndex, 1) ~= 1) then
		SetNpcParam(nNpcIndex, 1, 1)
		local nCount = GetTask(TSK_COUNT_ONETIME)
		SetTask(TSK_COUNT_ONETIME, nCount + 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "�ҵ�ľ�ˣ���ý���")
		DelNpc(nNpcIndex)
	end
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end