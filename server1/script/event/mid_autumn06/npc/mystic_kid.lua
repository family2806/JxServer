--by ��־ɽ [2006-09-12]
--2006����֮���Ի�����,���ִ�С���Ի�����
--Illustration: ���� -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--�콱���
function main()
	if (au06_is_inperiod() == 0) then --
		Say("�������.", 0);
		return 1;
	end;
	if (au06_IsPayed_player() == 0) then
		Say("ֻ�г�ֵ��ҿ��Բμ�����", 0);
		return
	end;
	local str_Content = {
		"�������Ʋʵ�����./#determine_get( 1 )",
		"�������Ʋ��ǵ���./#determine_get( 2 )",
		"�������ƹ�״����./#determine_get( 3 )",
		"��������Բ�ε���./#determine_get( 4 )",
		"���������������./#determine_get( 5 )",
		"����������ʵ���./#determine_get( 6 )",
		"�����ں�æ!/oncancel"
	};
	Say("<color=yellow>����<color>�ܺÿ��������͸�С�ø���������������С�ý��͸������Լ����������±�.", getn(str_Content), str_Content);
end;

--ȷ���콱
function determine_get(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5, 6};
	Say("��������ѵ����͸�С��������?", 2, "�ϣ��С�ò�Ҫ������/#getaward("..tab_Index[nIndex]..")", "����!��������һ�������/oncancel");
end;

--���յý�
function getaward(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	local szCageName = tab_Lightcage[nIndex][3];
	
	--���û����Ʒ
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][1], -1) < 1) then
		Say("Ϊʲôƭ��˵���ҵ��ǻ�û�п�������!?", 1, "�����������ڴ���������./oncancel");
		return
	end;
	
	--�������ﵽ����
	if (GetTask(AU06_TK_EXP) >= EXP_AWARD_LIMIT) then
		Say("��л���������Ѿ����㹻�ĵ�����.", 1, "������ȥ�ƻ���ҪС�ģ�/oncancel");
		return
	end;
	
	--�۳�����
	if (ConsumeEquiproomItem(1, 6, 1, tab_Lightcage[nIndex][1], -1) ~= 1) then
		return
	end;
	--������Ʒ
	AddItem(6, 1, tab_Lightcage[nIndex][7], 1, 0, 0, 0);
	--����
	Say("лл! �����������±���������.", 0);
	Msg2Player("��õ�<color=yellow>"..tab_Lightcage[nIndex][8].."<color>.");
end;
