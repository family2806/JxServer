-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�� - �����ɵ�
-- �ļ�������item_beidouxiandan.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-26 13:30:12

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua");	-- ת��ͷ�ļ�
Include("\\script\\task\\task_addplayerexp.lua");			-- �ӵ��Ӿ���

function main(nItemIndex)
	local nphase = GetTask(TSK_ZHUANSHENG_XIANDAN);
	
	if (nphase == 1) then
		if (ST_IsTransLife() == 1) then
			local n_itemexp = GetItemParam(nItemIndex, 1);
			if (n_itemexp > 0 and n_itemexp <= 19900) then
				tl_addPlayerExp(n_itemexp*10000000);
				
				SetTask(TSK_ZHUANSHENG_XIANDAN, 2);
				
				Msg2Player(format("���%d ǧ����.", n_itemexp));
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUsed,LEVEL:%d,FACTION:%d,AddExp:%d0000000",
						"�����ɵ�",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), n_itemexp));
			else
				return 1;
			end
		else
			Say("��δ�����Ͳ���ʹ�ñ����ɵ�.", 0);
			return 1;
		end
	else
		Say("�ñ����ɵ����Ǵ����ģ����Բ���ʹ��.", 0);
		return 1;
	end
end

function GetDesc(nItemIndex)
	local n_itemexp = GetItemParam(nItemIndex, 1);
	return format("���ɵ����У�%d ǧ����.", n_itemexp);
end
