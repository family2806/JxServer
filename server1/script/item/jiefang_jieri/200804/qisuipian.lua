-- �ļ�������qisuipian.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-15 10:58:58
--�����Ƭ 

--ʹ�÷������Ҽ����ʹ�ú󽫻���ȡ304����ֵ304 ����� ��304��ָ4��30�յ���˼��
--ʹ�ý�ֹʱ�䣺2008��05��31��24��00��
--���ƣ�
--- ��ҵ��κεȼ�����ʹ�ô�����Ʒ��
--- ��ֵ��Ҳ���ʹ�á�
---�������鲻����
--- ��ڼ䣬һ����������ʹ��1975����
--SetSpecItemParam(nItemIndex, 1, tonumber(GetLocalDate("%Y%m%d")) )
--SetSpecItemParam(nItemIndex, 2, tonumber(GetLocalDate("%Y")) )
--SetSpecItemParam(nItemIndex, 3, tonumber(GetLocalDate("%m")) )
--SetSpecItemParam(nItemIndex, 4, tonumber(GetLocalDate("%d")) )


IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
function main(nItemIndex)
	jiefang_0804_ResetTask()
	
	local nItemData	= 20080531
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate > nItemData then
		Msg2Player("��Ʒʹ�ù��ڣ��Զ���ʧ.")
		return 0;
	end
	
	if IsCharged() == 0 then
		Say("ֻ���ѳ�ֵ��Ҳ���ʹ��.", 0)
		return 1;
	end
	local nCurFlagCount = GetTask(jiefang_0804_TSK_FlagCount)
	if nCurFlagCount >= jiefang_0804_TSKV_FlagCount then
		Say(format("��ʹ�� %d ����Ʒ���Ѵﵽʹ������.", jiefang_0804_TSKV_FlagCount), 0)
		return 1
	end
	AddOwnExp(304)
	SetTask(jiefang_0804_TSK_FlagCount, nCurFlagCount + 1)
	return 0;
end