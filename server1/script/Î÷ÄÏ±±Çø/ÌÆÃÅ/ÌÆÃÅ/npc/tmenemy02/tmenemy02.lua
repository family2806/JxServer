--description: �����񺣵ڶ��ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	UTask_tmtmp = GetTaskTemp(48)
	if (Uworld37 == 20) and (random(0,99) < 50) then		-- ������ʱ��50%���ʳ�����һ��ھ�������䣩
		if (UTask_tmtmp == 0) then
			Talk(1,"","2 4 Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
			SetTaskTemp(48,1)
		elseif (UTask_tmtmp == 1) then 
			Talk(1,"","68 Ϊ��")
			Msg2Player("�õ��ھ�������Ϊ��")
			SetTaskTemp(48,2)
		elseif (UTask_tmtmp == 2) then 
			Talk(1,"","��������")
			Msg2Player("�õ��ھ�����������")
			SetTaskTemp(48,3)
		elseif (UTask_tmtmp == 3) then 
			Talk(1,"","������һ")
			Msg2Player("�õ��ھ���������һ")
			SetTaskTemp(48,4)
		elseif (UTask_tmtmp == 4) then 
			Talk(1,"","�������")
			Msg2Player("�õ��ھ����������")
			SetTaskTemp(48,5)
		else
			if (random(1,99) < 40) then		-- ������ʾһ�οھ���Ȼ��͸�λ��ʱ�������ٿ�Ҫ����������
				SetTaskTemp(48,0)
				Msg2Player("�����Ŀھ�Ϊ������Ϊ�磬����Ϊ�㣬�������ߣ�������һ���������")
			end
		end
	end
end
