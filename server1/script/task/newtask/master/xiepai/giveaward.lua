
-- ����ϵͳа�̷���������
-- Edited by peres
-- 2005/01/13 PM 22:12

Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");

-- �������Ϊ������ȼ�

function nt_givePlayerAward(myTaskLevel)

local i
local myAwardText1,myAwardText2 = "",""
local myGolden = {168,169,170,171,172,173,174,175,176}

	if (myTaskLevel==1) then -- ����� 20 ������
		

		
	elseif (myTaskLevel==2) then -- ����� 30 ������
		
		AddOwnExp(80000)
		AddGoldItem(0,177)  --������ñ��

		myAwardText1 = "80000 �㾭��ֵ"
		myAwardText2 = "һ�����Ƶ�ñ��"
		
	elseif (myTaskLevel==3) then -- ����� 40 ������

		AddOwnExp(280000)	
		ClearMagicPoint()  --����40��ʱϴ��Ĺ���
		
		myAwardText1 = "150000 �㾭��ֵ"
		myAwardText2 = "һ�����ϴ���ܵ�Ļ���"
				
	elseif (myTaskLevel==4) then -- ����� 50 ������
		
		local nRandom=random(1,2);
		
		AddOwnExp(350000)
		
		if nRandom==1 then
			AddItem(6,1,72,1,1,1,0)  -- ��ɽ
		else
			AddItem(6,1,73,1,1,1,0)  -- �׹�
		end;

		myAwardText1 = "350000 �㾭��ֵ"
		myAwardText2 = "һ���ɲ�¶"
				
	elseif (myTaskLevel==5) then -- ����� 60 ������

		AddOwnExp(800000)		
		i = random(1,getn(myGolden))
		AddGoldItem(0,myGolden[i])
		
		myAwardText1 = "800000 �㾭��ֵ"
		myAwardText2 = "һ�������ı���"
		
	end
	
	return myAwardText1,myAwardText2

end
