--��ԭ����\��ţɽ\����Ȫ����\ս��_�׾�.lua
--by xiaoyang (2004\4\20)

function OnDeath()
Uworld129 = GetTask(129)
	if (Uworld129 == 55) then
		SetTask(129,60)
		Talk(1,"",".....����������ô�������׾�ֻ�����̲̽�ĵ��ӣ������˸��ұ����������˽�������....")
		Msg2Player("����׾����ȳ����˵�����Ȫ. ")
		i = random(0,99)
		if (i < 33) then
			NewWorld(41, 1951, 2989)
		elseif (i < 67) then
			NewWorld(41, 1685, 3268)
		else
			NewWorld(41, 1788, 3085)
		end
   end
end
