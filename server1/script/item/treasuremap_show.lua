
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������ر�ͼ��Ʒʹ�ô����ļ�
-- Edited by peres
-- 2005/10/19 PM 14:22

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

Include("\\script\\task\\random\\treasure_head.lua");  -- �ر�ͼ���͹���


function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local nRow = magiclevel1;

	if magiclevel2==0 then
		return "<enter>һ�Ż���ɽˮ������λ�õ�ͼƬ�����Ŵ�ͼ��ʶ�����ر��ص����ڵء�<enter>Ȼ������ȥ�Ѿ��ƾɲ������ƺ�ֻ��<color=green>��Ȫ��<color>������<color=green>������<color>���ܽ����ͼ��<enter>";
	else
		return showTreasureText(nRow)
	end;

end;

-- ��ʾ�ر�ͼ�����λ����Ϣ
function showTreasureText(nRow)

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

	return "<enter>һ�Ż���ɽˮ������λ�õ�ͼƬ�����Ŵ�ͼ��ʶ�����ر��ص����ڵء�<enter><enter>"..
		   "ͼ������ԼԼ��ʾ��������<color=green>"..strInfo.."<color><enter><enter>"..
		   "<color=yellow>�����Ҽ����ɿ�ʼ�ھ�<color><enter>";

end;