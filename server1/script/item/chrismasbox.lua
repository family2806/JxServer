-- ���ʥ����Ʒ�У�������һ��������ߣ�
-- By: zhengfei(2004-12-13)

function main(sel)
	p=random(0,99)
	if (p < 50) then
		AddItem(0,11,70,0,0,0,0)		-- ʥ������
		Msg2Player("ʥ�����֣���õ���һ��ʥ�����˵����Ŷ��")
	else
		AddItem(0,11,71,0,0,0,0)	        -- ʥ����ʹ
		Msg2Player("ʥ�����֣���õ���һ��ʥ����ʹ�����Ŷ��")
	end
	return 0
end
