Include("\\script\\task\\newtask\\newtask_head.lua")

function main(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local nWorldMaps = nt_getTask(1027) -- ������������ж��ٸ�ɽ�����ͼ
	if (detail == 440) then
		-- ���������100��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 100;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("���õ�100��ɽ�����ͼ��Ƭ�������ڹ��� "..nWorldMaps.." �����ͼ��Ƭ��");
	elseif (detail == 2514) then
		-- ���������1000��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 1000;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("���õ�1000��ɽ�����ͼ��Ƭ�������ڹ��� "..nWorldMaps.." �����ͼ��Ƭ��");
	end
end
