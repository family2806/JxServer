-- �ļ�������zhanbeiyingpiao.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-15 10:27:57
--ս����Ʊ
--��Ʒ�ϵ�˵����������ս�����������1��㡱
--ʹ�ý�ֹʱ�䣺2008��05��18��24��00��
--ʹ�÷������Ҽ����ʹ��
--���ƣ�ֻ�а�������ʹ�ô���Ʒ��
--��¼ʹ��ս����ƱLOG
IncludeLib("SETTING");
if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItemIndex)
	
	local nItemData	= GetItemParam(nItemIndex, 1);	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate >= nItemData then
		Msg2Player("��Ʒʹ�ù��ڣ��Զ���ʧ.")
		return 0;
	end
	
	
	local nBuildFund = 10000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("δ�����ᣬ����ʹ�øõ���.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t AddTongBuildFund %d.","use zhanbeiyingpiao",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nBuildFund))
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)
		
		return 0;
	else
		Msg2Player("���ǰ���������ʹ�øõ���.");
		return 1
	end
end

function GetDesc(nItemIndex)

end