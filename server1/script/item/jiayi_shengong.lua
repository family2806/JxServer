
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ת������ ��������������ƪ ����
-- FileName: jiayi_shengong.lua
-- Edited: �ӷ���
-- 2007-03-30	20:14:00

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")

function main()
	
	if (check_zhuansheng_level() == 1) then
		
		if (GetTask(TSK_ZHUANSHENG_FLAG) == 0) then
			Msg2Player(format("��ѧ��%s, ��Ҫѧ%s ���ܹ�������.", "<����������-����ƪ>", "<����������-�ķ�ƪ>"));
			Say(format("��ѧ�� %s,  ���ǣ��书��Ȼ��δ���������������ﻹ������û���ƽ� %s<color=yellow> %s<color> ���˽�һ����Ϣ.", 
							"<����������-����ƪ>", "������", "��������"), 0);
			
			SetTask(TSK_ZHUANSHENG_FLAG,1);
			
			WriteLog(format("[��������]\t%s\tName:%s\tAccount:%s\t ѧϰ����:%d, ����:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber()));
			return 0;
		else
			Msg2Player("��ѧ<����������-����ƪ> �ˣ�ֻ����ѧ<����������-�ķ�ƪ> ���ܹ���������.");
			return 1;
		end
	
	end
	return 1;
end
