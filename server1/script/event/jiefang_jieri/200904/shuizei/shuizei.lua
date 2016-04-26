Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\lib\\awardtemplet.lua")
--�������� - ���1���Ѽ���ѫ������� - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")
tbjf0904_shuizei_exp =
{
	[1]	= {nExp = 10, 	nRate = 0.3},
	[2]	= {nExp = 15, 	nRate = 0.4},
	[3]	= {nExp = 20, 	nRate = 0.2},
	[4]	= {nExp = 25, 	nRate = 0.05},
	[5]	= {nExp = 30, 	nRate = 0.05},
};


function join_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("���ڻʱ����.", 0);
		return
	end
	
	jf0904_InitTaskctrl();
	
	if(GetTask(jf0904_TSK_shuizei_GetTask) ~= 0) then
		Say("������ȡ��������ˮ��.", 0);
		return
	end
	
	Say("��������: ����ˮ�����аԵ��������˺ܶ��������������Ĵ�ֻ.��Ҫ�����е���������Щɽ����",2,"���Ѿ�����������1��./join_shuizei_act_cf", "�Һ�æ�����ʱ������./OnCancel");
end

function join_shuizei_act_cf()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("�����ȼ�����50������δ��ֵ����˲��ܲμӻ", 0);
		return
	end

	if (GetTask(jf0904_TSK_shuizei_FulfilTaskTime) <= 0) then
		Say("���첻��������ȡ����ˮ����������.", 0);
		return
	end
	
	Say("�ɹ���ȡ����ˮ������!", 0);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime) - 1);
	SetTask(jf0904_TSK_shuizei_GetTask, 1);
end

function fullfill_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("���ڻʱ����.", 0);
		return
	end
	
	if (GetTask(jf0904_TSK_shuizei_GetTask) ~= 1) then
		Say("��δ��ȡˮ����������޷�������!", 0);
		return
	end
	
	give_shuizei_award_lingpai();
end


function give_shuizei_award_lingpai()
	GiveItemUI("��׷����", "���׷����������棬ÿ��ֻ�ܷ�1��.", "submit_zhuigongling", "no")
end

function submit_zhuigongling(nCount)
	if (nCount ~= 1) then
		Say("������������!", 2, "������˼! �����·�./give_shuizei_award_lingpai", "��һ�����/no")
		return 
	end
	local nItemIdx = GetGiveItemUnit(1);
	local ng, nd, np = GetItemProp(nItemIdx);
	if (ng == 6 and nd == 1 and np == 2015) then
		RemoveItemByIndex(nItemIdx);
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		Say("����ף�ش�����������Ӣ������Ľ���.", 0);
		--�������� - ���1���Ѽ���ѫ������� - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FLD_Collect_Item_VNG");
		give_shuizei_award_exp();
	else
		Say("����������Ʒ����!", 2, "������˼�������¸���./give_shuizei_award_lingpai", "��һ�����sau/no");
	end
end


function give_shuizei_award_exp()
	local nstep = random(1, 100000);
	local ncurstep 	= 0;
	local naddedexp = 0;
	for i = 1, getn(tbjf0904_shuizei_exp) do
		if (ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000 >= nstep) then
			naddedexp = tbjf0904_shuizei_exp[i].nExp;
			break;
		end
		ncurstep = ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000;
	end
	
	AddOwnExp(naddedexp * 1000000);
	
end

function jf0904_shuizei_IsActtime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	return (nDate >= jf0904_act_dateS);
end

function about_shuizei()
	Say("���: ����ˮ�����28/04/2009��ʼ. ��ڼ�������Ե�������ϱ����ĸ����콱.", 0);
end