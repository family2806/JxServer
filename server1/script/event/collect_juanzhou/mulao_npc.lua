
Include("\\script\\lib\\pay.lua");	--��ֵ���ж�

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70314 and nDate <= 70321) then
		Say("�Ϸ������ռ�������ͼ�������λ���԰�����, �Ϸ�һ��������л", 3,
					"��10��������ͼ��������/sure2takeboxaward",
					"��10��������ͼ�ͽ�ʯ��������/sure2takeboxaward",
					"�һ�����������Ҫ��/OnCancel");
	else
		Say("��������ռ������ؾ��ᣬ���ᷢ�ָ�������α���",  0);
	end;
end;

function sure2takeboxaward(nSel)
	local nboxtype = nSel;
	local nmylevel = GetLevel();
	if (nmylevel < 50 or IsCharged() ~= 1) then
		Say("�治����˼! ֻ����� <color=yellow>50������<color>�ѳ�ֵ�˲ſ��Բμ�����.", 0);
		return
	end;
	
	local njuanzhou = CalcEquiproomItemCount(6,1,196,-1);
	if (njuanzhou < 10) then
		Say("�ҵ�10��������ͼ֮��������Ϸ�!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 6) then
		Say("����������!", 0);
		return
	end;
	--���ṻ�ˣ���Ҫʲô����
	if (nboxtype == 1) then	--�ƽ�
		if (CalcEquiproomItemCount(6,1,1376,-1) >= 1) then
			ConsumeEquiproomItem(1,6,1,1376,-1);
			ConsumeEquiproomItem(10, 6, 1, 196, -1)	--ɾ�����ӵ����ؾ���count��
			AddItem(6,1,1377,1,0,0);
			Msg2Player("�õ�<color=yellow>����");
			WriteLog(format("[�ռ�������ͼ�] \t %s\t ����:%s\t Account: %s\t �õ�һ������",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
		else
			Say("û�н�ʯ�ˣ�ֻ�ܻ������䣬ͬ����?", 2, 
						"��10��������ͼ������/sure2takeboxaward", 
						"�������±���/OnCancel");
			return
		end;
	else										--����
		ConsumeEquiproomItem(10, 6, 1, 196, -1)	--ɾ�����ӵ����ؾ���count��
		AddItem(6,1,1378,1,0,0);
		Msg2Player("�õ� <color=yellow>����");
		WriteLog(format("[�ռ�������ͼ�]\t %s\t Name: %s\t Account: %s\t �õ�1������",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
	end;
	Say("������! �����Ϸ��һ�����⣬�����£�", 0);
end;

function OnCancel()
end;
