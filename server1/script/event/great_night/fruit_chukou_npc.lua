--˫��������NPC�Ự�ű�


function main()
	local tbDialog =
	{
		--"<desc><npc>��������������ȥ��",
	  	"�뿪/return_city",
	  	"һ����� /no",
	}
	--CreateTaskSay(tbDialog)
	Describe("<color=yellow>ս����������: <color>��ȷ��Ҫ�Ҵ����ȥ��?",getn(tbDialog), unpack(tbDialog))
end;

function no()
end

function return_city()
	UseTownPortal()--ͬʹ�ûسǷ���Ч��
--	nCityIndex = 2 --�سɶ�
--	if (nCityIndex == 1) then
--		NewWorld(1, 1557, 3112) -- ����		
--	elseif (nCityIndex == 2) then
--		NewWorld(11, 3193, 5192) -- �ɶ�	
--	elseif (nCityIndex == 3) then
--		NewWorld(162, 1669, 3129) -- ����	
--	elseif (nCityIndex == 4) then
--		NewWorld(37, 1598, 3000) -- �꾩
--	elseif (nCityIndex == 5) then
--		NewWorld(78, 1592, 3377) -- ����
--	elseif (nCityIndex == 6) then
--		NewWorld(80, 1670, 2996) -- ����		
--	elseif (nCityIndex == 7) then
--		NewWorld(176, 1603, 2917) -- �ٰ�
--	else
--		Msg2Player("ϵͳ���ִ������ҿͷ���Աȷ�Ͻ������");
--	end	
end


