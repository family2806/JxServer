
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
Include("\\script\\activitysys\\g_activity.lua")			--��༭��
Include("\\script\\activitysys\\playerfunlib.lua")		--��༭��

function main(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);

	if nRow==0 or nRow==nil then
		Msg2Player("<color=Orange>���Ųر�ͼ�Ѿ��ƾɲ����ˣ�û�κ���;�ˡ�<color>");
		return 1;
	end;

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local nMapState = GetItemMagicLevel(nIndex, 2);

local nResult = 0;
local picLink = "";

	if nMapState==0 then
		Msg2Player("<color=Orange>����Ųر�ͼ�����ﶫ�����䣬һ�����񡭡�����ȥ��Ȫ���Ҹ�����ָ��ָ�̰ɣ�<color>");
		return 1;
	else
		picLink = "<link=image:"..picPath..">�ر�ͼ����Ϣ��<link>���˴�Ѵ�ѵ����Ӵ����������ڸ������ָ������ϡ�����Ų�ȱ��ȫ�Ĳر�ͼ�б��ϳ��˱��صĴ���λ�á�ƾ������ǰ�ḻ������������Ĺ۲������㷢�����ƺ���<color=yellow>"..strInfo.."<color>��";
		Describe(picLink, 2,
				 "��ʼ�ھ�/#useTreasureMap("..nIndex..")",
				 "�ر�/OnExit");
		return 1;
	end;

end;

function useTreasureMap(nIndex)

local nResult = MapCheckTreasurePos(nIndex);
local nDelResult = 0;

	if nResult==1 then
		
		-- ����ɹ��ڳ������ˣ��򽫸���Ʒɾ��
		nDelResult = RemoveItemByIndex(nIndex);
		
		if nDelResult==1 then
			UseTreasurePos();
			
			G_ACTIVITY:OnMessage("FinishCangBaoTu");
			
			return 1;
		else
			Msg2Player("<color=Orange>����Ųر�ͼ�����ﶫ�����䣬һ�����񡭡�<color>");
			return 1;	
		end;
		
	elseif nResult==0 then
		Msg2Player("<color=Orange>����Ųر�ͼ�����ﶫ�����䣬һ�����񡭡�<color>");
		return 1;
	elseif nResult==2 then
		Msg2Player("<color=yellow>��Բر�ͼ�����Ķ���һͷ��ˮ����ͼ�����Ǽٻ���ȥ<color><color=green>��Ȫ��<color><color=yellow>��<color><color=green>������<color><color=yellow>����һ�°ɣ�<color>");
		return 1;
	end;
		
end;


function OnExit()

end;