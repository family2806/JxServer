--���꿨����
Include([[\script\event\teachersday06_v\head.lua]]);

--�������
function vt06_prizeenter()
	if (vt06_isactive() == 0) then
		return 0;
	end;
	
	Describe("�������ʦ�ڣ���λ����<color=yellow>80������<color> ��ɻƽ�ɱ��BOSS��ɱ��ɫBOSS�����л�����4���� һ��Ϊʦ����4���ָ�ʦ������ַ����ø�ͽ����ʦ������ö�ʦ�������Խ���������������Ʒ�����뻻ʲô����", 3, "���뻻��ʦ��/#vt06_sendgift(1)", 
		"���뻻��ͽ��#vt06_sendgift(2)", "�뿪/no");
end;

tab_Goods = {{"��ʦ��", 1293}, {"��ͽ��", 1295}};
tab_Idx = {1, 2, 3, 4, 5, 6}

function vt06_sendgift(nIdx)
	Say("�ռ����ܶ࿨������ֵ��������<color=yellow>1<color>"..tab_Goods[nIdx][1].." ����� <color=yellow>40 ���<color>, <color=yellow>2<color>"..tab_Goods[nIdx][1].." ���c <color=yellow>100 v�n �i�m<color>, <color=yellow>5<color>"..tab_Goods[nIdx][1].." ���c <color=yellow>300 v�n �i�m<color>.", 4,
	"���뻻 1 "..tab_Goods[nIdx][1].." 40���/#vt06_giveprize("..nIdx..", 1, 400000)",
	"���뻻 2 "..tab_Goods[nIdx][1].." 100���/#vt06_giveprize("..nIdx..", 2, 1000000)",
	"���뻻 5 "..tab_Goods[nIdx][1].." 300���/#vt06_giveprize("..nIdx..", 5, 3000000)",
	"ȡ��/no");
end;

function vt06_giveprize(nIdx, nCount, nExp)
	local nOwnedExp = GetTask(TK_EXPLIMIT);
	
	if (nOwnedExp >= VT06_EXPLIMIT) then
		Say("�����<color=yellow>"..VT06_EXPLIMIT.."<color> ����ֵ�������ٻ����!", 0);
		return
	end;
	
	if (CalcEquiproomItemCount(6,1,tab_Goods[nIdx][2],-1) < nCount) then
		Say("�������� <color=yellow>"..nCount.."<color>"..tab_Goods[nIdx][1].."! ����Ŭ��Ŷ", 0);
		return
	end;
	
	--ɾ��Ʒ
	if (ConsumeEquiproomItem(nCount,6,1,tab_Goods[nIdx][2],-1) == 0) then
		return
	end;

	--�Ӿ���
	nOwnedExp = nOwnedExp + nExp;
	SetTask(TK_EXPLIMIT, nOwnedExp);
	AddOwnExp(nExp);
	Say("�����<color=yellow>"..nExp.."<color> ����ֵ.", 0);
end;