--description: �������渾��ɩ
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(205) == 1 then
		allbrother_0801_FindNpcTaskDialog(205)
		return 0;
	end
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40������
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 3) then		-- ����������
			Talk(1,"","�����˳������㣬�⼸���Ҫ�ؼ��ˣ���������������������ɼ�������Ӷ������ˣ���������æ��ϴ�£����ܰ���ȥ�������ӻ�����Щ���ӻ�����?")
			SetTask(14, 5)
			AddNote("��������ˮկ�����渾��ɩ�������������ӻ�����Щ���ӻ���")
			Msg2Player("��������ˮկ�����渾��ɩ�������������ӻ�����Щ���ӻ���")
		elseif (UTask_tw40sub == 5) then
			if (HaveItem(148) == 1) then		-- ���������
				Talk(1,"","лл�������������ӣ���3�������͸���")
				DelItem(148)
				AddEventItem(149)
				Msg2Player("�õ�3������")
				SetTask(14, 7)
				AddNote("�����ӽ�����ɩ���õ�3������")
			else
				Talk(1,"","�ڰ����ذٻ�����������")
			end
		elseif (UTask_tw40sub == 7) then
			if (HaveItem(149) == 0) then
				AddEventItem(149)
				Talk(2,"","��ɩ! �Ҳ�С�İѼ�����������, ɩ�ӿ����ٸ��Ҽ�����?","����ܵ��İ������ﻹ��3���������͸���!")
			else
				Talk(1,"","�����������������ˣ���ô��û�п�����������")
			end
		elseif (UTask_tw40sub == 0) then
			Talk(1,"","˭�ܹ����ҵ������������̫����")
		else
			Talk(1,"","���Ϲ���ô���ڻ�û�л���")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","�������Ǹ���ʵ�ˣ������ڻ�ֻ�Ǹ������죬��֪ʲôʱ����ܳ���ͷ��!")
		else
			Talk(1,"","�ڱ�����ڶ໤���·�ϻ���������������ݣ��Ļ��������٣���ǰʹΪ���ֱ������ʹ����ܸɣ�����ʹ���������Բ��,")
		end
	end
end;
