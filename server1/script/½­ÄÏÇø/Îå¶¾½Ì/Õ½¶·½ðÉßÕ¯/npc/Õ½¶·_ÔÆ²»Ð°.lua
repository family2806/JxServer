-- ս��_�Ʋ�а.lua ս���Ʋ�а�����ű�
-- By: Xiao_Yang(2004-04-29)

function OnDeath()
	if (GetTask(124) == 35) then
		AddEventItem(387)
		SetTask(124,40)
		Talk(1,"","�����! ")
		Msg2Player("�����Ʋ�а�������ҵ�����Ц�涾�Ľ�ҩ")
		SetFightState(0)
		NewWorld(185,1612,3204)
	end
end
